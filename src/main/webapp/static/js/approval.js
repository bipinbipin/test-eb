
//  BEGIN GLOBAL VARIABLES
/**
 *  Holds the current timecard information and gets replaced on approval/denial.
 *
 *      Structure:
 *          currentTimecard = {
 *              billableOverTime, billableTime, denialReason,
 *              engineer: {
 *                  adpId, email, id, isPtoEligible, name, phone, tag, technology, version
 *              }, engineerPayRate, id, isApproved, isEditable, isHeld, isOnTime,
 *              isSubmitted, notes, payrollInstance,
 *              screenShots: [{
 *                  id, imageUrl, version
 *              }, ...], version,
 *              week: {
 *                  beginDate: [year, month, day],
 *                  endDate: [year, month, day], id,
 *                  notificationDateTime: [year, month, date, hour, minute], version
 *              },
 *              workDays: [{
 *                  code, dayOfYear, hours, id, ptoHours, version, year
 *              }, ...]
 *          }
 *
 */
var currentTimecard;

var displayDay;
//  END GLOBAL VARIABLES



//  BEGIN CONSOLE LOG UTILITY FUNCTIONS
/**
 *  Simple function to console log the specified object
 *
 *  @param isExecuted  (boolean) to display info (useful to leave this in functions)
 *  @param identifier  (string) text describing the object
 *  @param object      (object/string/etc.) the object itself
 */
function viewMaster(isExecuted, identifier, object) {
    if(isExecuted) {
        console.log(identifier);
        console.log(object);
    }
}


/**
 *  Since viewMaster doesn't work on unload (to quick) this is used to see the information
 *  for currentTimecard - explicitly called through an array.
 *
 *      Called By:  buildApprovalPage > releaseTimecard
 *
 * @param isExecuted    (boolean) to display info
 * @param items         (string array) list of keys for currentTimecard
 */
function catchThatUnload(isExecuted, items) {
    if(isExecuted) {
        console.log('RT CURRENT TIMECARD ITEMS');
        for (i = 0; i < items.length; i++) {
            console.log(items[i] + ': ' + currentTimecard[items[i]]);
        }
    }
}
//  END CONSOLE LOG UTILITY FUNCTIONS



//  BEGIN INITIALIZED FUNCTIONS
/**
 *  Encapsulates all the functions that get passed into approval.jsp
 *
 *  1. getOneTimeCard: Gets one timecard of the available editable timecards
 *  2. releaseTimecard: On unload it saves the currentTimecard (global)
 *  3. Shows/Hides pto info based on eligibility
 *  4. Onclick that allows the admin to change if the timecard is on time
 *      a. Sets current timecard to opposite of its current state
 *      b. viewMaster: Shows the current timecard information in console
 *      c. setIsOnTime: Changes checkbox to correct position/value
 */
function buildApprovalPage() {
    getOneTimecard();

    releaseTimecard();

    $('.has-pto').hide();

    var checkbox = $('#is-on-time').find('input');

    checkbox.on('click', function() {
        currentTimecard.isOnTime = !currentTimecard.isOnTime;

        viewMaster(true, 'CHANGE ON TIME CURRENT TIMECARD', currentTimecard);

        setIsOnTime();
    })
}
//  END INITIALIZED FUNCTIONS



//  BEGIN CHANGE FUNCTIONS
/**
 *  Changes the checkbox to the appropriate option (yes or no). Called on click.
 *
 *      Called by: buildApprovalPage, getOneTimeCard
 */
function setIsOnTime() {
    var checkbox = $('#is-on-time').find('input');

    if(currentTimecard.isOnTime)
    {
        checkbox.prop('checked', true);
    }
    else
    {
        checkbox.prop('checked', false);
    }
}


/**
 *  Changes the timecard's hours to editable inputs and the edit button to a save button.
 *
 *      Called By: Edit button
 */
function adminEditHours() {
    $('.hours').empty();

    //  loops through 7 days and adds the inputs
    for(i = 0; i < 7; i++) {
        var currentRow = '#hour-' + i;
        var currentWorkDay = currentTimecard.workDays[i].hours;

        //  display each workday hours
        viewMaster(false, 'CURRENT WORKDAY HOURS', currentWorkDay);

        $(currentRow).append('<input type="number" min="0" max="24" step=".25" class="form-control" value="' +
                             currentWorkDay +  '" id="hour-input-' + currentWorkDay +
                             '" onClick="this.select();" />');
    }

    //  changes the button from edit to save
    $('#edit-save').empty();
    $('#edit-save').append('<button class="btn btn-success btn-edit-save" onclick="adminSaveHours()"><i class="fa fa-save" />&nbsp;&nbsp;&nbsp;Save</button>');

}


/**
 *  Saves the timecard's hours, returns the hours to original form, and changes the save
 *  button to an edit button.
 *
 *      Called By: Save button
 */
function adminSaveHours() {

    //  loops through 7 days and adds hours to the table
    for(i = 0; i < 7; i++) {
        var currentRow = '#hour-' + i;
        var currentHours = $(currentRow).find('input').val();

        currentTimecard.workDays[i].hours = currentHours;

        $(currentRow).empty();
        $(currentRow).append(currentHours);

    }

    //  recalculates the billableTime and billableOvertime
    calculateBillableTime();

    //  changes the button from save to edit
    $('#edit-save').empty();
    $('#edit-save').append('<button class="btn btn-info btn-edit-save" onclick="adminEditHours()"><i class="fa fa-edit" />&nbsp;&nbsp;&nbsp;Edit</button>');

    //  resets billableTime
    $('#billable-time').empty();
    $('#billable-time').append(currentTimecard.billableTime);

    //  resets billableOverTime
    $('#billable-overtime').empty();
    $('#billable-overtime').append(currentTimecard.billableOverTime);
}
//  END CHANGE FUNCTIONS



//  BEGIN REST CALL FUNCTIONS
/**
 *  Gets the first available timecard via PayrollRest. Populates appropriate elements in
 *  the jsp.
 *
 *      Called By: buildPayrollPage, saveApproval
 */
function getOneTimecard() {
    //BEGIN AJAX
    $.getJSON('api/payroll/', { ajax: 'true' },
        function (timecard) {

            //  if there is no timecard redirect to payroll (CHANGE THIS)
            if(timecard.id == null) { window.location.replace('http://localhost:8000/payroll'); }

            currentTimecard = timecard;     //  sets currentTimecard to this timecard

            //  show timecard
            viewMaster(false, 'GOT CURRENT TIMECARD', timecard);

            setIsOnTime(timecard.isOnTime);

            //  checks to see if week is present and if not it will provide it
            if($('#week').is(':empty')) {
                $('#week').append(timecard.week.beginDate.toString());
            }

            //  BEGIN REQUIRED INFO
            $('#engineer-name').append(timecard.engineer.name);

            $('#billable-time').append(timecard.billableTime);
            $('#billable-overtime').append(timecard.billableOverTime);

            $.each(timecard.workDays, function(index, workDay) {
                //  checks to see if the dates are present and if not will provide it
                if($('#date-6').is(':empty')) {
                    displayDay = workDay.id;
                    var workDate = getDateFromDayNum(workDay.dayOfYear);

                    $('#date-' + index).append(workDate);
                }

                $('#hour-' + index).append(workDay.hours);  //  appends the timecards hours
            });

            //  todo:   carousel functionality
            $('#screen-shots').append(
                '<img class="img-responsive img-thumbnail" src="/static/img/test-pics/1-13-approved.png" />'
            );
            //  END REQUIRED INFO

            //  BEGIN OPTIONAL INFO
            //  if there are notes then show them
            if(timecard.notes != null && timecard.notes != "")
            {
                $('#notes-label').show();
                $('#notes').append('<h3>' + timecard.notes + '</h3>');
                $('.note-style').show();
            } else {
                $('.note-style').hide();
                $('#notes-label').hide();
            }

            //  if the engineer is eligible for PTO then show the info
            if(!timecard.engineer.isPtoEligible) {
                $('#no-pto').show();
                $('.has-pto').hide();
            } else {
                $.getJSON('api/timeoffbank/engineer/' + timecard.engineer.id, {ajax: 'true'},
                    function (ptoBank) {
                        $('#no-pto').hide();
                        $('.has-pto').show();

                        viewMaster(false, "PTO BANK", ptoBank);

                        $('#pto-used').append(ptoBank.totalPtoHoursUsed);
                        $('#pto-remaining').append(ptoBank.totalPtoHoursRemaining);
                        $('#pto-accrual').append((timecard.billableTime * 0.0385));
                    }
                );
            }
            //  END OPTIONAL INFO
        });
    //  END AJAX
}


/**
 *  Saves the approval or denial of current timecard and loads in the next one.
 *
 *      Called By:  Approve button & Deny button
 *
 * @param isApproved    (boolean) used to deny or approve the timecard
 */
function saveApproval(isApproved) {

    //  shows current timecard
    viewMaster(false, 'SA CURRENT TIMECARD', currentTimecard);

    //  if approved save isApproved as true, load new timecard, and show notification
    if(isApproved)
    {
        currentTimecard.isApproved = true;

        //  save the approved timecard
        $.ajax({
            contentType: 'application/json',
            type: "post",
            data: JSON.stringify(currentTimecard),
            url: "/api/payroll/timecard/",
            async: true,
            dataType: "json",
            success: function() {
                $("#successSave").show();
            },
            error: function(){
                $("#failedSave").show();
            }
        });

        //  display notification box
        //  todo:   figure out information to go here
        $.bigBox({
            title: 'Approved ' + currentTimecard.engineer.name,
            content: 'Quick overview of items',
            color: "#739e73",
            timeout: 10000,
            icon: "fa fa-check fadeInLeft animated",
        });

        //  clear the timecard information and get the next editable timecard
        clearTimecardInfo();
        getOneTimecard();
    }
    else    //  else double check denial, hold timecard, load new timecard, and show notification
    {
        //  asks to confirm denial and give denial reason
        $.SmartMessageBox({
            title : 'Please input a denial reason',
            content : 'Why was this timecard not filled out correctly?',
            buttons : '[Process][Go Back]',
            input : 'text',
            placeholder: 'Enter your denial reason',
            inputValue: ''
        }, function(buttonPress, value) {

            //  if confirm denial set timecard criteria and save
            if(buttonPress == "Process") {
                currentTimecard.isEditable = true;
                currentTimecard.isHeld = true;
                currentTimecard.denialReason = value;

                //  save timecard
                $.ajax({
                    contentType: 'application/json',
                    type: "post",
                    data: JSON.stringify(currentTimecard),
                    url: "/api/payroll/timecard/",
                    async: true,
                    dataType: "json",
                    success: function() {
                        $("#successSave").show();
                    },
                    error: function(){
                        $("#failedSave").show();
                    }
                });

                //  display notification box
                //  todo:   figure out information to go here
                $.bigBox({
                    title : 'Denied ' + currentTimecard.engineer.name,
                    content : currentTimecard.denialReason,
                    color : "#C46A69",
                    timeout: 10000,
                    icon : "fa fa-warning shake animated",
                });

                //  clear the timecard information and get the next editable timecard
                clearTimecardInfo();
                getOneTimecard();
            }
        });
    }
}


/**
 *  When admin leaves the page it will save the currentTimecard. Requires synchronous AJAX.
 *
 *      Called By:  buildPayrollPage
 */
function releaseTimecard() {
    $(window).unload(function(e) {

        //  shows the boolean flags
        catchThatUnload(false, [
            'isApproved', 'isEditable', 'isHeld', 'isOnTime', 'isSubmitted'
        ]);


        //  checks if timecard isn't approved and isn't held and sets editable to true
        if(!currentTimecard.isApproved && !currentTimecard.isHeld) {
            currentTimecard['isEditable'] = true;

            //  save current timecard
            $.ajax({
                contentType: 'application/json',
                type: "post",
                data: JSON.stringify(currentTimecard),
                url: "/api/timecard/",
                async: false,
                dataType: "json",
                success: function () {
                    $("#successSave").show();
                },
                error: function () {
                    $("#failedSave").show();
                }
            })
        }
    });
}
//  END REST CALL FUNCTIONS



//  BEGIN SPECIFIC USE FUNCTIONS
/**
 *  Creates and returns a string (day name/month name/day) based on the dayOfYear
 *  from the buildTimecardTable AJAX call
 *
 *  @param dayNum       (int) day of the year
 *  @param year         (int) the year of the day of the year
 *  @returns {string}   Day Name/Month Name/Day
 */
function getDateFromDayNum(dayNum, year){         // pass in the Day of Year

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
}


/**
 *  Clears out current information in jsp for inputting the next timecard.
 *
 *      Called By:  saveApproval
 */
function clearTimecardInfo() {
    //  IDs
    $('#engineer-name').empty();
    $('#billable-time').empty();
    $('#billable-overtime').empty();
    $('#pto-used').empty();
    $('#pto-remaining').empty();
    $('#pto-accrual').empty();
    $('#screen-shots').empty();
    $('#notes').empty();

    //  Classes
    $('.hours').empty();
}


/**
 *  Adds each workDay hours and calculates overtime and normal time.
 */
function calculateBillableTime() {
    var totalTime = 0;

    //  iterates through the 7 days
    for(i = 0; i < 7; i++) {
        totalTime += parseInt(currentTimecard.workDays[i].hours);

        //  shows running total
        viewMaster(false, 'TOTAL COUNT', totalTime);
    }

    //  if total time is greater than 40 calculate overTime
    if(totalTime > 40)
    {
        currentTimecard.billableOverTime = totalTime - 40;
        currentTimecard.billableTime = 40;
    }
    else
    {
        currentTimecard.billableOverTime = 0;
        currentTimecard.billableTime = totalTime;
    }
}
//  END SPECIFIC USE FUNCTIONS