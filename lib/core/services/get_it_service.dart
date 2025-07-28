import 'package:get_it/get_it.dart';
import 'package:grocery/core/services/firebase_auth_service.dart';
import 'package:grocery/core/services/firestore_service.dart';
import 'package:grocery/features/auth/data/repos/auth_repo_impl.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
