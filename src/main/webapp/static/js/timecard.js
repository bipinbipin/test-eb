/**
 *  Contributors:   Tony Morano, Josh Nickleby, Eric Johnson, Victor Johnson, Bipin Butala
 */


var masterTimecard;     //  holds the engineer timecard currently selected
var thisWeekId;         //  holds the current week's id
var currentDate = new Date();

//  used as the document ready functions
function buildStartPage() {
    //  default is the current week

//    Dropzone.autoDiscover = false;
    buildTimecardByWeek();

    //  enables buildTimecardByWeek based on selected week
    changeTimecard();



    $("#successSave").hide();
    $("#failedSave").hide();
    $("#submitButton").hide();
    $("#saveButton").hide();
}


/**
 *  attaches timecard id to dropzone uploader
 */
function attachTimecardIdToDropzone() {
    //
//    var timecardId = masterTimecard["id"];

    console.log("DROPZONE CONFIG")
    console.log(masterTimecard);

    var timecardId = $('#timecard-id').val();

    $("div#ssdropzone").dropzone({
        url: "/screenshot/upload",
        addRemoveLinks: true,
        acceptedFiles: 'image/*',       // only allows files of type image
        maxFilesize: 5,                 // limits filesize to 5MB
        autoProcessQueue: true,         // prevents async
        parallelUploads: 1,             // prevents async
        //dictDefaultMessage: '<span><span class="text-center"><span class="font-lg visible-xs-block visible-sm-block visible-lg-block"><span class="font-lg"><i class="fa fa-caret-right text-danger"></i> Drop files <span class="font-xs">to upload</span></span><span>&nbsp;&nbsp;<h4 class="display-inline"> (Or Click)</h4></span></span></span></span>',
        dictResponseError: 'Error uploading file!',
        init: function () {
            this.on("sending", function (file, xhr, formData) {
                formData.append("timecardId", timecardId);
                //formData.append("data", "moreData");
            });

            this.on("addedfile", function(file) {
                file.previewElement.addEventListener("click", function() {
                    alert('/screenshot/' + file.id);
                });
            });

            this.on("success", function(file, response) {
                // populates the new upload with id from response.
                file.id = response.screenshotId;
            });

            this.on("removedfile", function(file) {
                alert("Delete this file?");
                console.log(file);
                $.ajax({
                    url: '/api/timecard/' + timecardId + '/screenshot/' + file.id,
                    type: "DELETE",
                    data: { 'filetodelete': file.name}
                });
            });
        }

    });

    console.log($("div#ssdropzone"));
}

function populateDropzone() {

    var myDropzone = Dropzone.forElement("#ssdropzone");

    $.each(masterTimecard.screenShots, function (index, value) {
        viewMaster(false, 'SCREENSHOT FOUND:', value);

        // mock file for dropzone
        var shot = {    name: value.filename,
                        size: 55555,
                        id: value.id    };

        myDropzone.emit("addedfile", shot);
        myDropzone.emit("complete", shot);
        myDropzone.createThumbnailFromUrl(shot, '/screenshot/' + value.id);


    });

}


/**
 *      simple function to console log the specified object
 *
 *  @param isExecuted  (boolean to display info)
 *  @param identifier  (text describing the object)
 *  @param object      (the object itself)
 */
function viewMaster(isExecuted, identifier, object) {
    if(isExecuted) {
        console.log(identifier);
        console.log(object);
    }
}
function ifDropzoneExistsDestroy(selector) {

//    maybe use the below to find the dropzone??
//        $(".dz-preview:last-child")
    console.log("TEST TO SEE IF DROPZONE EXISTS");
    console.log($(selector).find('.dz-default'));
    var elements = $(selector).find('.dz-default');
    var exists = elements.length > 0;
    console.log(exists);
    if(exists) {
        Dropzone.forElement("#ssdropzone").destroy();
    }

};

/**
 *      builds out the timecard (by weekId) and allows for editable vs uneditable hours
 *
 *  @param  weekId      the id of the week selected in the dropdown
 *  @param  editable    a boolean denoting if the inputs are editable
 */
function buildTimecardTable(weekId) {

    $.getJSON("/api/timecard/" + weekId, {
        ajax: 'true'
    }, function (timecard) {
        var totalBillableTime = timecard.billableTime + timecard.billableOverTime;
        var workDays = timecard.workDays;
        var notes = timecard.notes;
        var engineerId = timecard.engineer.id;


        //  saves to the global variable, updates when new week is selected
        masterTimecard = timecard;

        //$('#timecard-id').val(timecard.id);

        //  boolean = whether or not to log to console
        viewMaster(false, 'TIMECARD DATA RETRIEVED', timecard);
        viewMaster(true, 'CURRENT MASTER TIMECARD', masterTimecard);
        viewMaster(false, 'WORKDAYS', workDays);



        // todo: fix this shit
        // DOESN'T WORK :(
//        ifDropzoneExistsDestroy

        //  sets dropzone options and attaches timecardId to upload
        attachTimecardIdToDropzone();

        //  populate dropzone with existing screenshot
        populateDropzone();

        //  standard td open and close tags
        var td_ = '<td><input type="number" min="0" max="24" step=".25" class="WorkDay form-control input-lg" placeholder="# of hours" value=';
        var _td_ = ' onClick="this.select();"';
        var _td = ' /></td>';

        $('#WorkDaysDates').empty();
        $('#TotalPTO').empty();


        //  if uneditable apply readonly tag
        if(!timecard.isEditable) {
            _td_ = '  readonly';
        }

        var year = timecard.week.notificationDateTime[0]
        var day = timecard.week.notificationDateTime[2]
        var month = timecard.week.notificationDateTime[1]
        var checkDateString = month +',' + day + ',' + year;
        var finalNoticeDate= Date.parse(checkDateString);
        var cDate = Date.parse(currentDate);


        if(timecard.isEditable && !timecard.isApproved &&  cDate > finalNoticeDate){
            $("#submitButton").show();
            $("#saveButton").hide();
            console.log("Testing")
        }

        if(cDate < finalNoticeDate){
            $("#saveButton").show();
        }

        //  displays timecard hours and dates
        $.each(workDays, function (index, workDay) {
            var number = roundToNearestQuarter(workDay.hours);
            var workDate = getDateFromDayNum(workDay.dayOfYear);

            $('#WorkDaysDates').append('<td>' + workDate + '</td>' );
            $('#WorkDays').append(td_ + number + _td_ + _td);
        });

        //  displays total billable hours (including overtime)
        $('#TotalWeeklyHours').append('<h4><strong>Total Hours:</strong> ' + '<strong>' + totalBillableTime + '</strong>'+ '</h4>');

        $('#inputNotes').val(notes);

        if(timecard.engineer.isPtoEligible){

            generateTimeOffBank(engineerId);
        }
        else $('#TotalPTO').hide();

        if(timecard.engineer.isTrainee){
            $('#screenShot').hide();
        }
    });
}
function generateTimeOffBank(engineerId){
    $.getJSON("/api/timeoffbank/engineer/" + engineerId,{
        ajax: 'true'},function(timeOffBank){
        var totalPTO = timeOffBank.totalPtoHoursAccrued;
        $('#TotalPTO').append('<h4> Total PTO Remaining: '+ roundToFloor(totalPTO) + '</h4>')
    });
}


/**
 *      Gets the current week and 2 previous and passes in current weeks id into
 *  Timecard's get by week rest controller and returns that weeks Timecard information.
 */
function buildTimecardByWeek() {
    //  gets an object with week id, week dayOfYear, and a string of the week's start
    //  and end date. It also calls the timecard rest controller within it
    $.getJSON("/api/week/", {ajax: 'true'},
        function (weekData) {
            //  for use to getTimecardByWeekIdAndEmployeeADPId in buildTimecardTable
            thisWeekId = weekData[0]['id'];

            viewMaster(true, "WEEK DATA", weekData);

            //  creates a select box of the last three weeks (including this week)
            $.each(weekData, function (index, week) {
                $('#WeekSelect').append(
                    '<option value=' + week.id + ' >' +
                    week.weekString + '</option>'
                )
            });

            //  builds out this weeks timecard (editable = true)
            buildTimecardTable(thisWeekId);
        }
    );
}


/**
 *      clears timecard info and populates it based off week id. If current week make
 *  hours editable otherwise make them uneditable.
 */
function changeTimecard() {
    $('select').on('change', function() {

        $("#submitButton").hide();
        $("#saveButton").hide();

        $('#TotalWeeklyHours').empty();
        $('#WorkDays').empty();


        buildTimecardTable(this.value, false);
        attachTimecardIdToDropzone();
    });
}


/**
 *      Updates current timecard hours, screenShots, and notes
 */
function saveTimecard() {

    //  saves workDay hours into masterTimecard
    $('.WorkDay').each(function (index, workday) {
        viewMaster(false, '(SAVE) WORKDAY ' + (index + 1), workday);

        //  masterTimecard has workDays object (with an array of workdays) which get passed into this variable
        var timecardWorkDay = masterTimecard.workDays[index];

        timecardWorkDay['hours'] = parseFloat(workday.value);
    });

    masterTimecard.notes = $('#inputNotes').val();

    viewMaster(false, '(SAVE) STRINGIFIED TIMECARD', console.log(JSON.stringify(masterTimecard)));

    $.ajax({
        contentType: 'application/json',
        type: "post",
        data: JSON.stringify(masterTimecard),
        url: "/api/timecard/",
        async: true,
        dataType: "json",
        success: function() {
            //location.reload(false);
            $("#successSave").show();
            location.reload(true);
        },
        error: function(){
            $("#failedSave").show();
        }
    })
}

function submitTimecard() {

    //  saves workDay hours into masterTimecard
    $('.WorkDay').each(function (index, workday) {
        viewMaster(false, '(SAVE) WORKDAY ' + (index + 1), workday);

        //  masterTimecard has workDays object (with an array of workdays) which get passed into this variable
        var timecardWorkDay = masterTimecard.workDays[index];

        timecardWorkDay['hours'] = parseFloat(workday.value);
    });

    masterTimecard.notes = $('#inputNotes').val();

    masterTimecard.isSubmitted = true;
    masterTimecard.isHeld = false;

    viewMaster(false, '(SAVE) STRINGIFIED TIMECARD', console.log(JSON.stringify(masterTimecard)));

    $.ajax({
        contentType: 'application/json',
        type: "post",
        data: JSON.stringify(masterTimecard),
        url: "/api/timecard/",
        async: true,
        dataType: "json",
        success: function() {
            $("#successSave").show();
            location.reload(true);
        },
        error: function(){
            $("#failedSave").show();
        }
    })
}

/**
 *      Rounds a float number to the nearest quarter value. e.g. 1.13 will round to 1.25,
 *  2.55 will round to 2.5
 *
 *  @param      num         number to round
 *  @returns    {string}    string of a fixed number
 */
var roundToNearestQuarter = function(num) {
    return (Math.round(num * 4) / 4).toFixed(2);
};

var roundToFloor = function(num) {
    return (Math.floor(num * 4) / 4).toFixed(2);
};


/**
 *      Creates and returns a string (day name/month name/day) based on the dayOfYear
 *  from the buildTimecardTable AJAX call
 *
 *  @param      dayNum      day of the year
 *  @param      year        the year of the day of the year
 *  @returns    {string}    A string of (Day Name/Month Name/Day)
 */
var getDateFromDayNum = function(dayNum, year){         // pass in the Day of Year

    var date = new Date();
    if(year){
        date.setFullYear(year);
    }
    date.setMonth(0);
    date.setDate(0);
    var timeOfFirst = date.getTime();                   // this is the time in milliseconds of 1/1/YYYY
    var dayMilli = 86400000;                            // 60 * 60 * 24 * 1000
    var dayNumMilli = dayNum * dayMilli;
    date.setTime(timeOfFirst + dayNumMilli);
    return date.toString().slice(0,10);
};



