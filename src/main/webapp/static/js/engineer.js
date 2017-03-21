var masterEngineer;

function buildStartPage(){

    getEngineerInformation();

};

function getEngineerInformation(engineerId){
    $.getJSON("api/engineer/" + engineerId , {
        ajax: 'true'},function(engineer){
        var name = engineer.name;
        var adpId = engineer.adpId;
        var email = engineer.email;
        var engId = engineer.id;
        var tech = engineer.technology;
        masterEngineer = engineer;

        $('#engineer-table').find('tbody')
            .append("<tr>" +
            "<td>" + name +"</td>"+
            "<td>" + adpId +"</td>"+
            "<td id = lateTime>" +   "</td>"+
            "<td>"  + email+ "</td>"+
            "<td>"  + tech+ "</td>"+
            "</tr>");

        createTotalLateSubmissions(engId);
        getAllTimeCardsForEngineer(adpId);

        if(!engineer.isPtoEligible) {

         $('#ptoBank').hide();
        }
        else{
            generateTimeOffBank(engId)
        }

    });
}

function getAllTimeCardsForEngineer(adpId){
    $.getJSON("api/timecard/timecards/" + adpId,{
        ajax: 'true'}, function(timecards){


        var lastId = timecards.length;
        console.log(lastId);
        $.each(timecards, function (index, timecard) {

            var onTime;

            if (index == 0) {
                onTime = ('<a href="/timecard" title="Click here for current timecard"><button class="btn btn-warning"> Current </button> ');
            }

            else if (timecard.isOnTime && index !=0) {
                    onTime = ('<span class="glyphicon glyphicon-ok-sign is-on-time-icon"></span>');
                }

            else {
                onTime = ('<span class="glyphicon glyphicon-remove-sign is-not-on-time-icon"></span>');
            }

            var status;

            if (timecard.isApproved) {
               status = ('<button class="btn btn-success btn-payroll-status">Approved</button>'
                );
            } else if (!timecard.isSubmitted) {
               status = ( '<button class="btn btn-danger btn-payroll-status">Not Submitted</button>'
                );
            } else if (timecard.isHeld) {
               status = (
                    '<div id="timecard' + timecard.id + '"> <button class="btn btn-warning btn-payroll-status" onclick="unlockTimecard(' + timecard.id + ')">Held</button></div>'    // tooltip
                );
            } else {
               status = (
                    '<button class="btn btn-info btn-payroll-status">Pending</button>'
                );
            };

            $('#timecard-info').find('tbody')
                    .append("<tr>" +
                    "<td>" + beginDateBuilder(timecard) + " - " + endDateBuilder(timecard)  + "</td>" +
                    "<td>" + timecard.billableTime  + "</td>" +
                    "<td>" + timecard.billableOverTime  + "</td>" +
                    "<td class='text-align-center'>" + onTime  + "</td>" +
                    "<td class='text-align-center'>" + status + "</td>" +
                    "<td>" + timecard.screenShots[0].imageUrl  + "</td>" +
                    "</tr>");

            $('#timeCards').show();

    });
})}

function createTotalLateSubmissions(engineerId) {
    $.getJSON("api/engineer/" + engineerId + "/latetimecard", {
            ajax: 'true'
        },
        function (lateSubmission) {
            var lateSubmissionTotal = lateSubmission;

            $('#lateTime').append(lateSubmissionTotal[0]);

            if(lateSubmissionTotal[0] > 0)
            {
                flagLateTimecards();
            }
        });

}

function generateTimeOffBank(engineerId){
    $.getJSON("/api/timeoffbank/engineer/" + engineerId,{
        ajax: 'true'},function(timeOffBank){
        var totalPto = timeOffBank.totalPtoHoursAccrued;
        var ptoUsed = timeOffBank.totalPtoHoursUsed;
        var ptoRemains = timeOffBank.totalPtoHoursRemaining;

        $('#timeOffBank-table').find('tbody')
            .append("<tr>" +
            "<td>" + roundToFloor(totalPto) +"</td>"+
            "<td>" + roundToFloor(ptoUsed) + "</td>"+
            "<td>"  + roundToFloor(ptoRemains) + "</td>"+
            "</tr>");

    });
}

var roundToFloor = function(num) {
    return (Math.floor(num * 4) / 4).toFixed(2);
};

var beginDateBuilder = function(timecard){

    var day = timecard.week.beginDate[2];
    var month = timecard.week.beginDate[1];
    var year  = timecard.week.beginDate[0];

    if(day.toString().length < 2){
        day = "0" + day;
    }

    if(month.toString().length < 2){
        month = "0" + month;
    }

    var beginStringDate = month + "/" + day + "/" + year ;

    return beginStringDate;
};
var endDateBuilder = function(timecard){

    var day = timecard.week.endDate[2];
    var month = timecard.week.endDate[1];
    var year  = timecard.week.endDate[0];

    if(day.toString().length < 2){
        day = "0" + day;
    }

    if(month.toString().length < 2){
        month = "0" + month;
    }

    var endStringDate = month + "/" + day + "/" + year ;

    return endStringDate;
};

function flagLateTimecards() {

    $.SmartMessageBox({
        title: 'Too Many Late Timecards',
        content: 'You have failed miserably at submitting your timecards, turn down the suck knob and turn up the good.  In accordance with Aston Technologies Time Card Policy you may face penalties such as .....' +
        'Please hit accept if you agree to the Timecard Policy Terms of Agreement',

        color:'#FF0000',
    });
}
