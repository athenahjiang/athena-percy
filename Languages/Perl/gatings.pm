####
#### Gatings
####

# Athena Conf (any)
Athena::Conf::AthenaNet::Behavior('eligibility')->{elid_revamp}->{user_preference_key};
Athena::Conf::AthenaNet::Rollout('eligibility')->{get_enhanced_eligibility_history};

# Nimbus Apps (frontend)
BusCall::Nimbus::GetApplicationVersion({
  APPNAME => 'your-app-name',
  USERNAME => $Global::session{USERNAME},
});

# Rollout Toggles (backend)
Athena::RolloutToggle::GetEnabledVersion($dbh, { KEY => 'TOGGLE_NAME' });

# Practice Settings (database contexts)
BusCall::PracticeStructure::GetTablespaceValue($dbh, { KEY => 'SETTING_NAME' });
# $ATHENA_HOME/perllib/Athena/TableSpaceInfoKey.pm
# $ATHENA_HOME/perllib/Athena/TableSpaceInfoKey/Keys/Collector.pm
