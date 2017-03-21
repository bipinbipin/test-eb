/**
 *  Contributors:   Josh Nickleby
 */


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
//  END CONSOLE LOG UTILITY FUNCTIONS



// BEGIN BUTTON CHANGE FUNCTIONS
/**
 *  Sends a rest call to PayrollRest to set isHeld to false
 *
 * @param timecardId    (int) timecard to edit
 */
function unlockTimecard(timecardId) {
    $.getJSON('api/payroll/timecard/' + timecardId, {ajax: 'true'},
        function (timecardData) {
            //  element
            var selector = '#status-' + timecardId;

            //  changes the button to pending
            $(selector).empty();
            $(selector).append('<button class="btn btn-info btn-payroll-status" onclick="changeApproval(' + timecardId + ', ' + timecardData.isApproved + ')">Pending</button>');
        });
}


/**
 *  Sends a rest call to PayrollRest to set isApproved to opposite
 *
 * @param timecardId    (int) timecard to edit
 * @param isApproved    (boolean) if approved or not
 */
function changeApproval(timecardId, isApproved) {

    //  sets timecard opposite to current timecard approval
    $.getJSON('api/payroll/timecard/' + timecardId + '/isApproved/' + isApproved, {ajax: 'true'},
        function (timecardData) {
            //  element
            var selector = '#status-' + timecardId;

            //  static element info
            var btn_ = '<button class="btn btn-';
            var _btn_ = ' btn-payroll-status" onclick="';
            var _btn = '</button>';

            //  final button element
            var final;

            viewMaster(true, "TIMECARD", timecardData);

            //  assigns the button to append
            if(timecardData.isApproved) {
                final = btn_ + 'success' + _btn_ + 'changeApproval(' + timecardId + ', ' + timecardData.isApproved + ')">Approved' + _btn;
            } else {
                final = btn_ + 'warning' + _btn_ + 'unlockTimecard(' + timecardId + ')">Held' + _btn;
            }

            viewMaster(false, "FINAL STRING", final);

            //  sets the new button
            $(selector).empty();
            $(selector).append(final);
        });
}


/**
 *  Sends a rest call to PayrollRest to set isOnTime to opposite
 *
 * @param timecardId    (int) timecard to edit
 * @param isOnTime      (boolean) if on time or not
 */
function changeOnTime(timecardId, isOnTime) {

    //  sets timecard opposite to current timecard is on time
    $.getJSON('api/payroll/timecard/' + timecardId + '/isOnTime/' + isOnTime, { ajax: 'true' },
        function(timecardData) {
            //  element
            var selector = '#is-on-time-change-' + timecardId;

            //  static element info
            var span_ = '<span class="glyphicon glyphicon-';
            var _span_ = 'sign is';
            var _span = '-on-time-icon" onclick="changeOnTime(' + timecardId + ', ' + timecardData.isOnTime + ')"></span>';

            //  final button element
            var final;

            //  assigns the button to append
            if(timecardData.isOnTime) {
                final = span_ + 'ok-' + _span_ + _span;
            } else {
                final = span_ + 'remove-' + _span_ + '-not' + _span;
            }

            $(selector).empty();
            //  sets the new button
            $(selector).append(final);
        })
}
// END BUTTON CHANGE FUNCTIONS
