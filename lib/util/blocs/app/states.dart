abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppDatabaseInitialized extends AppStates {}

class AppDatabaseTableCreated extends AppStates {}

class AppDatabaseOpened extends AppStates {}

class AppDatabaseTaskCreated extends AppStates {}

class AppDatabaseLoading extends AppStates {}

class AppDatabaseTasks extends AppStates {}
class AppDatabaseData extends AppStates {}

class AppSelectUser extends AppStates {}

class AppDatabaseTaskCreatedStatus extends AppStates {}

class DeleteTasks extends AppStates {}

