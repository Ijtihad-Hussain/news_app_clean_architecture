
import 'package:fpdart/fpdart.dart';

import '../../../../common/entities/user.dart';
import '../../../../error/failures.dart';
import '../../../../usecase/usecase.dart';
import '../repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
