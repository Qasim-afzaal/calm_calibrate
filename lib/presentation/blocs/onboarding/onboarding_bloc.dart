import 'package:calm_calibrate/core/debug/app_logger.dart';
import 'package:calm_calibrate/data/repositories/user_repository.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:calm_calibrate/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? MockUserRepository.instance,
        super(const OnboardingState()) {
    on<OnboardingNameSet>(_onNameSet);
    on<OnboardingPainAreaToggled>(_onPainAreaToggled);
    on<OnboardingSittingHoursSet>(_onSittingHoursSet);
    on<OnboardingBreakTimeToggled>(_onBreakTimeToggled);
    on<OnboardingGoalToggled>(_onGoalToggled);
    on<OnboardingReminderMinutesSet>(_onReminderMinutesSet);
    on<OnboardingSmartRemindersSet>(_onSmartRemindersSet);
    on<OnboardingPartialProfileSaveRequested>(_onPartialProfileSave);
  }

  final UserRepository _userRepository;

  void _onNameSet(OnboardingNameSet event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPainAreaToggled(
    OnboardingPainAreaToggled event,
    Emitter<OnboardingState> emit,
  ) {
    final updated = Set.of(state.painAreas);
    if (updated.contains(event.area)) {
      updated.remove(event.area);
    } else {
      updated.add(event.area);
    }
    emit(state.copyWith(painAreas: updated));
  }

  void _onSittingHoursSet(
    OnboardingSittingHoursSet event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(sittingHours: event.hours));
  }

  void _onBreakTimeToggled(
    OnboardingBreakTimeToggled event,
    Emitter<OnboardingState> emit,
  ) {
    final updated = Set.of(state.preferredBreakTimes);
    if (updated.contains(event.time)) {
      updated.remove(event.time);
    } else {
      updated.add(event.time);
    }
    emit(state.copyWith(preferredBreakTimes: updated));
  }

  void _onGoalToggled(
    OnboardingGoalToggled event,
    Emitter<OnboardingState> emit,
  ) {
    final updated = Set.of(state.goals);
    if (updated.contains(event.goal)) {
      updated.remove(event.goal);
    } else {
      updated.add(event.goal);
    }
    emit(state.copyWith(goals: updated));
    AppLogger.debug('onboarding', 'goals=${updated.map((g) => g.name).join(', ')}');
  }

  void _onReminderMinutesSet(
    OnboardingReminderMinutesSet event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(reminderMinutes: event.minutes));
  }

  void _onSmartRemindersSet(
    OnboardingSmartRemindersSet event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(smartReminders: event.enabled));
  }

  Future<void> _onPartialProfileSave(
    OnboardingPartialProfileSaveRequested event,
    Emitter<OnboardingState> emit,
  ) async {
    final current = _userRepository.profile;
    final trimmedName = state.name.trim();
    await _userRepository.saveProfile(
      current.copyWith(
        name: trimmedName.isNotEmpty ? trimmedName : current.name,
        painAreas: state.painAreas,
        sittingHours: state.sittingHours,
        preferredBreakTimes: state.preferredBreakTimes,
        goals: state.goals,
        reminderMinutes: state.reminderMinutes,
        smartReminders: state.smartReminders,
      ),
    );
    AppLogger.debug(
      'onboarding',
      'profile saved painAreas=${state.painAreas.length} goals=${state.goals.length}',
    );
  }
}
