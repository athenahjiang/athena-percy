<!-- COPOP -->

# perl

## pm
$ATHENA_HOME/htdocs/schedule/checkin.esp
$ATHENA_HOME/perllib/Athena/Appointment/Views/CheckIn.pm (GenerateStartReactAppJS)
$ATHENA_HOME/perllib/Athena/PatientPayment/CheckIn.pm (GenerateCollectPaymentHTML)

## whiskers
$ATHENA_HOME/htdocs/static/templates/checkin/main.whiskers
$ATHENA_HOME/htdocs/static/templates/checkin/todaysvisit.whiskers
$ATHENA_HOME/htdocs/static/templates/checkin/tos-updated-payment-method-section.whiskers
$ATHENA_HOME/htdocs/static/patientpayment/collectpayment.js

# sql
select ID, PATIENTID from APPOINTMENT where STATUS = 'f' and STARTCHECKIN is not null order by CREATED desc fetch first 10 rows only;
* 1564354
* 1564353
* 1564073
* 1563558

# jquery
show_lightbox_button = jQuery('#percy-test-app-button-react');
show_lightbox_button.click();
