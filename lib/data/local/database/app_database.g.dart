// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfileRowsTable extends UserProfileRows
    with TableInfo<$UserProfileRowsTable, UserProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfileRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('there'),
  );
  static const VerificationMeta _sittingHoursMeta = const VerificationMeta(
    'sittingHours',
  );
  @override
  late final GeneratedColumn<String> sittingHours = GeneratedColumn<String>(
    'sitting_hours',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String> goal = GeneratedColumn<String>(
    'goal',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderMinutesMeta = const VerificationMeta(
    'reminderMinutes',
  );
  @override
  late final GeneratedColumn<int> reminderMinutes = GeneratedColumn<int>(
    'reminder_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(45),
  );
  static const VerificationMeta _smartRemindersMeta = const VerificationMeta(
    'smartReminders',
  );
  @override
  late final GeneratedColumn<bool> smartReminders = GeneratedColumn<bool>(
    'smart_reminders',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("smart_reminders" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _onboardingCompleteMeta =
      const VerificationMeta('onboardingComplete');
  @override
  late final GeneratedColumn<bool> onboardingComplete = GeneratedColumn<bool>(
    'onboarding_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _streakDaysMeta = const VerificationMeta(
    'streakDays',
  );
  @override
  late final GeneratedColumn<int> streakDays = GeneratedColumn<int>(
    'streak_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _mobilityPointsMeta = const VerificationMeta(
    'mobilityPoints',
  );
  @override
  late final GeneratedColumn<int> mobilityPoints = GeneratedColumn<int>(
    'mobility_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPremiumMeta = const VerificationMeta(
    'isPremium',
  );
  @override
  late final GeneratedColumn<bool> isPremium = GeneratedColumn<bool>(
    'is_premium',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_premium" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sittingHours,
    goal,
    reminderMinutes,
    smartReminders,
    onboardingComplete,
    streakDays,
    mobilityPoints,
    isPremium,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profile_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('sitting_hours')) {
      context.handle(
        _sittingHoursMeta,
        sittingHours.isAcceptableOrUnknown(
          data['sitting_hours']!,
          _sittingHoursMeta,
        ),
      );
    }
    if (data.containsKey('goal')) {
      context.handle(
        _goalMeta,
        goal.isAcceptableOrUnknown(data['goal']!, _goalMeta),
      );
    }
    if (data.containsKey('reminder_minutes')) {
      context.handle(
        _reminderMinutesMeta,
        reminderMinutes.isAcceptableOrUnknown(
          data['reminder_minutes']!,
          _reminderMinutesMeta,
        ),
      );
    }
    if (data.containsKey('smart_reminders')) {
      context.handle(
        _smartRemindersMeta,
        smartReminders.isAcceptableOrUnknown(
          data['smart_reminders']!,
          _smartRemindersMeta,
        ),
      );
    }
    if (data.containsKey('onboarding_complete')) {
      context.handle(
        _onboardingCompleteMeta,
        onboardingComplete.isAcceptableOrUnknown(
          data['onboarding_complete']!,
          _onboardingCompleteMeta,
        ),
      );
    }
    if (data.containsKey('streak_days')) {
      context.handle(
        _streakDaysMeta,
        streakDays.isAcceptableOrUnknown(data['streak_days']!, _streakDaysMeta),
      );
    }
    if (data.containsKey('mobility_points')) {
      context.handle(
        _mobilityPointsMeta,
        mobilityPoints.isAcceptableOrUnknown(
          data['mobility_points']!,
          _mobilityPointsMeta,
        ),
      );
    }
    if (data.containsKey('is_premium')) {
      context.handle(
        _isPremiumMeta,
        isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sittingHours: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sitting_hours'],
      ),
      goal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal'],
      ),
      reminderMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_minutes'],
      )!,
      smartReminders: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}smart_reminders'],
      )!,
      onboardingComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_complete'],
      )!,
      streakDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}streak_days'],
      )!,
      mobilityPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mobility_points'],
      )!,
      isPremium: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_premium'],
      )!,
    );
  }

  @override
  $UserProfileRowsTable createAlias(String alias) {
    return $UserProfileRowsTable(attachedDatabase, alias);
  }
}

class UserProfileRow extends DataClass implements Insertable<UserProfileRow> {
  final int id;
  final String name;
  final String? sittingHours;
  final String? goal;
  final int reminderMinutes;
  final bool smartReminders;
  final bool onboardingComplete;
  final int streakDays;
  final int mobilityPoints;
  final bool isPremium;
  const UserProfileRow({
    required this.id,
    required this.name,
    this.sittingHours,
    this.goal,
    required this.reminderMinutes,
    required this.smartReminders,
    required this.onboardingComplete,
    required this.streakDays,
    required this.mobilityPoints,
    required this.isPremium,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sittingHours != null) {
      map['sitting_hours'] = Variable<String>(sittingHours);
    }
    if (!nullToAbsent || goal != null) {
      map['goal'] = Variable<String>(goal);
    }
    map['reminder_minutes'] = Variable<int>(reminderMinutes);
    map['smart_reminders'] = Variable<bool>(smartReminders);
    map['onboarding_complete'] = Variable<bool>(onboardingComplete);
    map['streak_days'] = Variable<int>(streakDays);
    map['mobility_points'] = Variable<int>(mobilityPoints);
    map['is_premium'] = Variable<bool>(isPremium);
    return map;
  }

  UserProfileRowsCompanion toCompanion(bool nullToAbsent) {
    return UserProfileRowsCompanion(
      id: Value(id),
      name: Value(name),
      sittingHours: sittingHours == null && nullToAbsent
          ? const Value.absent()
          : Value(sittingHours),
      goal: goal == null && nullToAbsent ? const Value.absent() : Value(goal),
      reminderMinutes: Value(reminderMinutes),
      smartReminders: Value(smartReminders),
      onboardingComplete: Value(onboardingComplete),
      streakDays: Value(streakDays),
      mobilityPoints: Value(mobilityPoints),
      isPremium: Value(isPremium),
    );
  }

  factory UserProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sittingHours: serializer.fromJson<String?>(json['sittingHours']),
      goal: serializer.fromJson<String?>(json['goal']),
      reminderMinutes: serializer.fromJson<int>(json['reminderMinutes']),
      smartReminders: serializer.fromJson<bool>(json['smartReminders']),
      onboardingComplete: serializer.fromJson<bool>(json['onboardingComplete']),
      streakDays: serializer.fromJson<int>(json['streakDays']),
      mobilityPoints: serializer.fromJson<int>(json['mobilityPoints']),
      isPremium: serializer.fromJson<bool>(json['isPremium']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sittingHours': serializer.toJson<String?>(sittingHours),
      'goal': serializer.toJson<String?>(goal),
      'reminderMinutes': serializer.toJson<int>(reminderMinutes),
      'smartReminders': serializer.toJson<bool>(smartReminders),
      'onboardingComplete': serializer.toJson<bool>(onboardingComplete),
      'streakDays': serializer.toJson<int>(streakDays),
      'mobilityPoints': serializer.toJson<int>(mobilityPoints),
      'isPremium': serializer.toJson<bool>(isPremium),
    };
  }

  UserProfileRow copyWith({
    int? id,
    String? name,
    Value<String?> sittingHours = const Value.absent(),
    Value<String?> goal = const Value.absent(),
    int? reminderMinutes,
    bool? smartReminders,
    bool? onboardingComplete,
    int? streakDays,
    int? mobilityPoints,
    bool? isPremium,
  }) => UserProfileRow(
    id: id ?? this.id,
    name: name ?? this.name,
    sittingHours: sittingHours.present ? sittingHours.value : this.sittingHours,
    goal: goal.present ? goal.value : this.goal,
    reminderMinutes: reminderMinutes ?? this.reminderMinutes,
    smartReminders: smartReminders ?? this.smartReminders,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    streakDays: streakDays ?? this.streakDays,
    mobilityPoints: mobilityPoints ?? this.mobilityPoints,
    isPremium: isPremium ?? this.isPremium,
  );
  UserProfileRow copyWithCompanion(UserProfileRowsCompanion data) {
    return UserProfileRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sittingHours: data.sittingHours.present
          ? data.sittingHours.value
          : this.sittingHours,
      goal: data.goal.present ? data.goal.value : this.goal,
      reminderMinutes: data.reminderMinutes.present
          ? data.reminderMinutes.value
          : this.reminderMinutes,
      smartReminders: data.smartReminders.present
          ? data.smartReminders.value
          : this.smartReminders,
      onboardingComplete: data.onboardingComplete.present
          ? data.onboardingComplete.value
          : this.onboardingComplete,
      streakDays: data.streakDays.present
          ? data.streakDays.value
          : this.streakDays,
      mobilityPoints: data.mobilityPoints.present
          ? data.mobilityPoints.value
          : this.mobilityPoints,
      isPremium: data.isPremium.present ? data.isPremium.value : this.isPremium,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sittingHours: $sittingHours, ')
          ..write('goal: $goal, ')
          ..write('reminderMinutes: $reminderMinutes, ')
          ..write('smartReminders: $smartReminders, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('streakDays: $streakDays, ')
          ..write('mobilityPoints: $mobilityPoints, ')
          ..write('isPremium: $isPremium')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    sittingHours,
    goal,
    reminderMinutes,
    smartReminders,
    onboardingComplete,
    streakDays,
    mobilityPoints,
    isPremium,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.sittingHours == this.sittingHours &&
          other.goal == this.goal &&
          other.reminderMinutes == this.reminderMinutes &&
          other.smartReminders == this.smartReminders &&
          other.onboardingComplete == this.onboardingComplete &&
          other.streakDays == this.streakDays &&
          other.mobilityPoints == this.mobilityPoints &&
          other.isPremium == this.isPremium);
}

class UserProfileRowsCompanion extends UpdateCompanion<UserProfileRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> sittingHours;
  final Value<String?> goal;
  final Value<int> reminderMinutes;
  final Value<bool> smartReminders;
  final Value<bool> onboardingComplete;
  final Value<int> streakDays;
  final Value<int> mobilityPoints;
  final Value<bool> isPremium;
  const UserProfileRowsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sittingHours = const Value.absent(),
    this.goal = const Value.absent(),
    this.reminderMinutes = const Value.absent(),
    this.smartReminders = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.streakDays = const Value.absent(),
    this.mobilityPoints = const Value.absent(),
    this.isPremium = const Value.absent(),
  });
  UserProfileRowsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sittingHours = const Value.absent(),
    this.goal = const Value.absent(),
    this.reminderMinutes = const Value.absent(),
    this.smartReminders = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.streakDays = const Value.absent(),
    this.mobilityPoints = const Value.absent(),
    this.isPremium = const Value.absent(),
  });
  static Insertable<UserProfileRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? sittingHours,
    Expression<String>? goal,
    Expression<int>? reminderMinutes,
    Expression<bool>? smartReminders,
    Expression<bool>? onboardingComplete,
    Expression<int>? streakDays,
    Expression<int>? mobilityPoints,
    Expression<bool>? isPremium,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sittingHours != null) 'sitting_hours': sittingHours,
      if (goal != null) 'goal': goal,
      if (reminderMinutes != null) 'reminder_minutes': reminderMinutes,
      if (smartReminders != null) 'smart_reminders': smartReminders,
      if (onboardingComplete != null) 'onboarding_complete': onboardingComplete,
      if (streakDays != null) 'streak_days': streakDays,
      if (mobilityPoints != null) 'mobility_points': mobilityPoints,
      if (isPremium != null) 'is_premium': isPremium,
    });
  }

  UserProfileRowsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? sittingHours,
    Value<String?>? goal,
    Value<int>? reminderMinutes,
    Value<bool>? smartReminders,
    Value<bool>? onboardingComplete,
    Value<int>? streakDays,
    Value<int>? mobilityPoints,
    Value<bool>? isPremium,
  }) {
    return UserProfileRowsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sittingHours: sittingHours ?? this.sittingHours,
      goal: goal ?? this.goal,
      reminderMinutes: reminderMinutes ?? this.reminderMinutes,
      smartReminders: smartReminders ?? this.smartReminders,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
      streakDays: streakDays ?? this.streakDays,
      mobilityPoints: mobilityPoints ?? this.mobilityPoints,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sittingHours.present) {
      map['sitting_hours'] = Variable<String>(sittingHours.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (reminderMinutes.present) {
      map['reminder_minutes'] = Variable<int>(reminderMinutes.value);
    }
    if (smartReminders.present) {
      map['smart_reminders'] = Variable<bool>(smartReminders.value);
    }
    if (onboardingComplete.present) {
      map['onboarding_complete'] = Variable<bool>(onboardingComplete.value);
    }
    if (streakDays.present) {
      map['streak_days'] = Variable<int>(streakDays.value);
    }
    if (mobilityPoints.present) {
      map['mobility_points'] = Variable<int>(mobilityPoints.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRowsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sittingHours: $sittingHours, ')
          ..write('goal: $goal, ')
          ..write('reminderMinutes: $reminderMinutes, ')
          ..write('smartReminders: $smartReminders, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('streakDays: $streakDays, ')
          ..write('mobilityPoints: $mobilityPoints, ')
          ..write('isPremium: $isPremium')
          ..write(')'))
        .toString();
  }
}

class $UserPainAreaRowsTable extends UserPainAreaRows
    with TableInfo<$UserPainAreaRowsTable, UserPainAreaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserPainAreaRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [area];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_pain_area_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserPainAreaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {area};
  @override
  UserPainAreaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserPainAreaRow(
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
    );
  }

  @override
  $UserPainAreaRowsTable createAlias(String alias) {
    return $UserPainAreaRowsTable(attachedDatabase, alias);
  }
}

class UserPainAreaRow extends DataClass implements Insertable<UserPainAreaRow> {
  final String area;
  const UserPainAreaRow({required this.area});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['area'] = Variable<String>(area);
    return map;
  }

  UserPainAreaRowsCompanion toCompanion(bool nullToAbsent) {
    return UserPainAreaRowsCompanion(area: Value(area));
  }

  factory UserPainAreaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserPainAreaRow(area: serializer.fromJson<String>(json['area']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'area': serializer.toJson<String>(area)};
  }

  UserPainAreaRow copyWith({String? area}) =>
      UserPainAreaRow(area: area ?? this.area);
  UserPainAreaRow copyWithCompanion(UserPainAreaRowsCompanion data) {
    return UserPainAreaRow(
      area: data.area.present ? data.area.value : this.area,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserPainAreaRow(')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => area.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserPainAreaRow && other.area == this.area);
}

class UserPainAreaRowsCompanion extends UpdateCompanion<UserPainAreaRow> {
  final Value<String> area;
  final Value<int> rowid;
  const UserPainAreaRowsCompanion({
    this.area = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserPainAreaRowsCompanion.insert({
    required String area,
    this.rowid = const Value.absent(),
  }) : area = Value(area);
  static Insertable<UserPainAreaRow> custom({
    Expression<String>? area,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (area != null) 'area': area,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserPainAreaRowsCompanion copyWith({Value<String>? area, Value<int>? rowid}) {
    return UserPainAreaRowsCompanion(
      area: area ?? this.area,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserPainAreaRowsCompanion(')
          ..write('area: $area, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserBreakTimeRowsTable extends UserBreakTimeRows
    with TableInfo<$UserBreakTimeRowsTable, UserBreakTimeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserBreakTimeRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _breakTimeMeta = const VerificationMeta(
    'breakTime',
  );
  @override
  late final GeneratedColumn<String> breakTime = GeneratedColumn<String>(
    'break_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [breakTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_break_time_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserBreakTimeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('break_time')) {
      context.handle(
        _breakTimeMeta,
        breakTime.isAcceptableOrUnknown(data['break_time']!, _breakTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_breakTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {breakTime};
  @override
  UserBreakTimeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserBreakTimeRow(
      breakTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}break_time'],
      )!,
    );
  }

  @override
  $UserBreakTimeRowsTable createAlias(String alias) {
    return $UserBreakTimeRowsTable(attachedDatabase, alias);
  }
}

class UserBreakTimeRow extends DataClass
    implements Insertable<UserBreakTimeRow> {
  final String breakTime;
  const UserBreakTimeRow({required this.breakTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['break_time'] = Variable<String>(breakTime);
    return map;
  }

  UserBreakTimeRowsCompanion toCompanion(bool nullToAbsent) {
    return UserBreakTimeRowsCompanion(breakTime: Value(breakTime));
  }

  factory UserBreakTimeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserBreakTimeRow(
      breakTime: serializer.fromJson<String>(json['breakTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'breakTime': serializer.toJson<String>(breakTime)};
  }

  UserBreakTimeRow copyWith({String? breakTime}) =>
      UserBreakTimeRow(breakTime: breakTime ?? this.breakTime);
  UserBreakTimeRow copyWithCompanion(UserBreakTimeRowsCompanion data) {
    return UserBreakTimeRow(
      breakTime: data.breakTime.present ? data.breakTime.value : this.breakTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserBreakTimeRow(')
          ..write('breakTime: $breakTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => breakTime.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserBreakTimeRow && other.breakTime == this.breakTime);
}

class UserBreakTimeRowsCompanion extends UpdateCompanion<UserBreakTimeRow> {
  final Value<String> breakTime;
  final Value<int> rowid;
  const UserBreakTimeRowsCompanion({
    this.breakTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserBreakTimeRowsCompanion.insert({
    required String breakTime,
    this.rowid = const Value.absent(),
  }) : breakTime = Value(breakTime);
  static Insertable<UserBreakTimeRow> custom({
    Expression<String>? breakTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (breakTime != null) 'break_time': breakTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserBreakTimeRowsCompanion copyWith({
    Value<String>? breakTime,
    Value<int>? rowid,
  }) {
    return UserBreakTimeRowsCompanion(
      breakTime: breakTime ?? this.breakTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (breakTime.present) {
      map['break_time'] = Variable<String>(breakTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserBreakTimeRowsCompanion(')
          ..write('breakTime: $breakTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionLogRowsTable extends SessionLogRows
    with TableInfo<$SessionLogRowsTable, SessionLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionLogRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prePainScoreMeta = const VerificationMeta(
    'prePainScore',
  );
  @override
  late final GeneratedColumn<int> prePainScore = GeneratedColumn<int>(
    'pre_pain_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _postPainScoreMeta = const VerificationMeta(
    'postPainScore',
  );
  @override
  late final GeneratedColumn<int> postPainScore = GeneratedColumn<int>(
    'post_pain_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mobilityPointsEarnedMeta =
      const VerificationMeta('mobilityPointsEarned');
  @override
  late final GeneratedColumn<int> mobilityPointsEarned = GeneratedColumn<int>(
    'mobility_points_earned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    completedAt,
    durationMinutes,
    prePainScore,
    postPainScore,
    mobilityPointsEarned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_log_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('pre_pain_score')) {
      context.handle(
        _prePainScoreMeta,
        prePainScore.isAcceptableOrUnknown(
          data['pre_pain_score']!,
          _prePainScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_prePainScoreMeta);
    }
    if (data.containsKey('post_pain_score')) {
      context.handle(
        _postPainScoreMeta,
        postPainScore.isAcceptableOrUnknown(
          data['post_pain_score']!,
          _postPainScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_postPainScoreMeta);
    }
    if (data.containsKey('mobility_points_earned')) {
      context.handle(
        _mobilityPointsEarnedMeta,
        mobilityPointsEarned.isAcceptableOrUnknown(
          data['mobility_points_earned']!,
          _mobilityPointsEarnedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mobilityPointsEarnedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
      prePainScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pre_pain_score'],
      )!,
      postPainScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}post_pain_score'],
      )!,
      mobilityPointsEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mobility_points_earned'],
      )!,
    );
  }

  @override
  $SessionLogRowsTable createAlias(String alias) {
    return $SessionLogRowsTable(attachedDatabase, alias);
  }
}

class SessionLogRow extends DataClass implements Insertable<SessionLogRow> {
  final String id;
  final String sessionId;
  final DateTime completedAt;
  final int durationMinutes;
  final int prePainScore;
  final int postPainScore;
  final int mobilityPointsEarned;
  const SessionLogRow({
    required this.id,
    required this.sessionId,
    required this.completedAt,
    required this.durationMinutes,
    required this.prePainScore,
    required this.postPainScore,
    required this.mobilityPointsEarned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['pre_pain_score'] = Variable<int>(prePainScore);
    map['post_pain_score'] = Variable<int>(postPainScore);
    map['mobility_points_earned'] = Variable<int>(mobilityPointsEarned);
    return map;
  }

  SessionLogRowsCompanion toCompanion(bool nullToAbsent) {
    return SessionLogRowsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      completedAt: Value(completedAt),
      durationMinutes: Value(durationMinutes),
      prePainScore: Value(prePainScore),
      postPainScore: Value(postPainScore),
      mobilityPointsEarned: Value(mobilityPointsEarned),
    );
  }

  factory SessionLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionLogRow(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      prePainScore: serializer.fromJson<int>(json['prePainScore']),
      postPainScore: serializer.fromJson<int>(json['postPainScore']),
      mobilityPointsEarned: serializer.fromJson<int>(
        json['mobilityPointsEarned'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'prePainScore': serializer.toJson<int>(prePainScore),
      'postPainScore': serializer.toJson<int>(postPainScore),
      'mobilityPointsEarned': serializer.toJson<int>(mobilityPointsEarned),
    };
  }

  SessionLogRow copyWith({
    String? id,
    String? sessionId,
    DateTime? completedAt,
    int? durationMinutes,
    int? prePainScore,
    int? postPainScore,
    int? mobilityPointsEarned,
  }) => SessionLogRow(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    completedAt: completedAt ?? this.completedAt,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    prePainScore: prePainScore ?? this.prePainScore,
    postPainScore: postPainScore ?? this.postPainScore,
    mobilityPointsEarned: mobilityPointsEarned ?? this.mobilityPointsEarned,
  );
  SessionLogRow copyWithCompanion(SessionLogRowsCompanion data) {
    return SessionLogRow(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      prePainScore: data.prePainScore.present
          ? data.prePainScore.value
          : this.prePainScore,
      postPainScore: data.postPainScore.present
          ? data.postPainScore.value
          : this.postPainScore,
      mobilityPointsEarned: data.mobilityPointsEarned.present
          ? data.mobilityPointsEarned.value
          : this.mobilityPointsEarned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionLogRow(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('prePainScore: $prePainScore, ')
          ..write('postPainScore: $postPainScore, ')
          ..write('mobilityPointsEarned: $mobilityPointsEarned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    completedAt,
    durationMinutes,
    prePainScore,
    postPainScore,
    mobilityPointsEarned,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionLogRow &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.completedAt == this.completedAt &&
          other.durationMinutes == this.durationMinutes &&
          other.prePainScore == this.prePainScore &&
          other.postPainScore == this.postPainScore &&
          other.mobilityPointsEarned == this.mobilityPointsEarned);
}

class SessionLogRowsCompanion extends UpdateCompanion<SessionLogRow> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<DateTime> completedAt;
  final Value<int> durationMinutes;
  final Value<int> prePainScore;
  final Value<int> postPainScore;
  final Value<int> mobilityPointsEarned;
  final Value<int> rowid;
  const SessionLogRowsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.prePainScore = const Value.absent(),
    this.postPainScore = const Value.absent(),
    this.mobilityPointsEarned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionLogRowsCompanion.insert({
    required String id,
    required String sessionId,
    required DateTime completedAt,
    required int durationMinutes,
    required int prePainScore,
    required int postPainScore,
    required int mobilityPointsEarned,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       completedAt = Value(completedAt),
       durationMinutes = Value(durationMinutes),
       prePainScore = Value(prePainScore),
       postPainScore = Value(postPainScore),
       mobilityPointsEarned = Value(mobilityPointsEarned);
  static Insertable<SessionLogRow> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<DateTime>? completedAt,
    Expression<int>? durationMinutes,
    Expression<int>? prePainScore,
    Expression<int>? postPainScore,
    Expression<int>? mobilityPointsEarned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (completedAt != null) 'completed_at': completedAt,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (prePainScore != null) 'pre_pain_score': prePainScore,
      if (postPainScore != null) 'post_pain_score': postPainScore,
      if (mobilityPointsEarned != null)
        'mobility_points_earned': mobilityPointsEarned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionLogRowsCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<DateTime>? completedAt,
    Value<int>? durationMinutes,
    Value<int>? prePainScore,
    Value<int>? postPainScore,
    Value<int>? mobilityPointsEarned,
    Value<int>? rowid,
  }) {
    return SessionLogRowsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      completedAt: completedAt ?? this.completedAt,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      prePainScore: prePainScore ?? this.prePainScore,
      postPainScore: postPainScore ?? this.postPainScore,
      mobilityPointsEarned: mobilityPointsEarned ?? this.mobilityPointsEarned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (prePainScore.present) {
      map['pre_pain_score'] = Variable<int>(prePainScore.value);
    }
    if (postPainScore.present) {
      map['post_pain_score'] = Variable<int>(postPainScore.value);
    }
    if (mobilityPointsEarned.present) {
      map['mobility_points_earned'] = Variable<int>(mobilityPointsEarned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionLogRowsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('completedAt: $completedAt, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('prePainScore: $prePainScore, ')
          ..write('postPainScore: $postPainScore, ')
          ..write('mobilityPointsEarned: $mobilityPointsEarned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JourneyMetaRowsTable extends JourneyMetaRows
    with TableInfo<$JourneyMetaRowsTable, JourneyMetaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JourneyMetaRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentDayMeta = const VerificationMeta(
    'currentDay',
  );
  @override
  late final GeneratedColumn<int> currentDay = GeneratedColumn<int>(
    'current_day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lastActiveDateMeta = const VerificationMeta(
    'lastActiveDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastActiveDate =
      GeneratedColumn<DateTime>(
        'last_active_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastCheckInDateMeta = const VerificationMeta(
    'lastCheckInDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastCheckInDate =
      GeneratedColumn<DateTime>(
        'last_check_in_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _checkedInTodayMeta = const VerificationMeta(
    'checkedInToday',
  );
  @override
  late final GeneratedColumn<bool> checkedInToday = GeneratedColumn<bool>(
    'checked_in_today',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("checked_in_today" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _prePainScoreMeta = const VerificationMeta(
    'prePainScore',
  );
  @override
  late final GeneratedColumn<int> prePainScore = GeneratedColumn<int>(
    'pre_pain_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _programStartDateMeta = const VerificationMeta(
    'programStartDate',
  );
  @override
  late final GeneratedColumn<DateTime> programStartDate =
      GeneratedColumn<DateTime>(
        'program_start_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    currentDay,
    lastActiveDate,
    lastCheckInDate,
    checkedInToday,
    prePainScore,
    programStartDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journey_meta_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<JourneyMetaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_day')) {
      context.handle(
        _currentDayMeta,
        currentDay.isAcceptableOrUnknown(data['current_day']!, _currentDayMeta),
      );
    }
    if (data.containsKey('last_active_date')) {
      context.handle(
        _lastActiveDateMeta,
        lastActiveDate.isAcceptableOrUnknown(
          data['last_active_date']!,
          _lastActiveDateMeta,
        ),
      );
    }
    if (data.containsKey('last_check_in_date')) {
      context.handle(
        _lastCheckInDateMeta,
        lastCheckInDate.isAcceptableOrUnknown(
          data['last_check_in_date']!,
          _lastCheckInDateMeta,
        ),
      );
    }
    if (data.containsKey('checked_in_today')) {
      context.handle(
        _checkedInTodayMeta,
        checkedInToday.isAcceptableOrUnknown(
          data['checked_in_today']!,
          _checkedInTodayMeta,
        ),
      );
    }
    if (data.containsKey('pre_pain_score')) {
      context.handle(
        _prePainScoreMeta,
        prePainScore.isAcceptableOrUnknown(
          data['pre_pain_score']!,
          _prePainScoreMeta,
        ),
      );
    }
    if (data.containsKey('program_start_date')) {
      context.handle(
        _programStartDateMeta,
        programStartDate.isAcceptableOrUnknown(
          data['program_start_date']!,
          _programStartDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JourneyMetaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JourneyMetaRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      currentDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_day'],
      )!,
      lastActiveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_active_date'],
      ),
      lastCheckInDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_check_in_date'],
      ),
      checkedInToday: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}checked_in_today'],
      )!,
      prePainScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pre_pain_score'],
      )!,
      programStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}program_start_date'],
      ),
    );
  }

  @override
  $JourneyMetaRowsTable createAlias(String alias) {
    return $JourneyMetaRowsTable(attachedDatabase, alias);
  }
}

class JourneyMetaRow extends DataClass implements Insertable<JourneyMetaRow> {
  final int id;
  final int currentDay;
  final DateTime? lastActiveDate;
  final DateTime? lastCheckInDate;
  final bool checkedInToday;
  final int prePainScore;
  final DateTime? programStartDate;
  const JourneyMetaRow({
    required this.id,
    required this.currentDay,
    this.lastActiveDate,
    this.lastCheckInDate,
    required this.checkedInToday,
    required this.prePainScore,
    this.programStartDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_day'] = Variable<int>(currentDay);
    if (!nullToAbsent || lastActiveDate != null) {
      map['last_active_date'] = Variable<DateTime>(lastActiveDate);
    }
    if (!nullToAbsent || lastCheckInDate != null) {
      map['last_check_in_date'] = Variable<DateTime>(lastCheckInDate);
    }
    map['checked_in_today'] = Variable<bool>(checkedInToday);
    map['pre_pain_score'] = Variable<int>(prePainScore);
    if (!nullToAbsent || programStartDate != null) {
      map['program_start_date'] = Variable<DateTime>(programStartDate);
    }
    return map;
  }

  JourneyMetaRowsCompanion toCompanion(bool nullToAbsent) {
    return JourneyMetaRowsCompanion(
      id: Value(id),
      currentDay: Value(currentDay),
      lastActiveDate: lastActiveDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActiveDate),
      lastCheckInDate: lastCheckInDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCheckInDate),
      checkedInToday: Value(checkedInToday),
      prePainScore: Value(prePainScore),
      programStartDate: programStartDate == null && nullToAbsent
          ? const Value.absent()
          : Value(programStartDate),
    );
  }

  factory JourneyMetaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JourneyMetaRow(
      id: serializer.fromJson<int>(json['id']),
      currentDay: serializer.fromJson<int>(json['currentDay']),
      lastActiveDate: serializer.fromJson<DateTime?>(json['lastActiveDate']),
      lastCheckInDate: serializer.fromJson<DateTime?>(json['lastCheckInDate']),
      checkedInToday: serializer.fromJson<bool>(json['checkedInToday']),
      prePainScore: serializer.fromJson<int>(json['prePainScore']),
      programStartDate: serializer.fromJson<DateTime?>(
        json['programStartDate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentDay': serializer.toJson<int>(currentDay),
      'lastActiveDate': serializer.toJson<DateTime?>(lastActiveDate),
      'lastCheckInDate': serializer.toJson<DateTime?>(lastCheckInDate),
      'checkedInToday': serializer.toJson<bool>(checkedInToday),
      'prePainScore': serializer.toJson<int>(prePainScore),
      'programStartDate': serializer.toJson<DateTime?>(programStartDate),
    };
  }

  JourneyMetaRow copyWith({
    int? id,
    int? currentDay,
    Value<DateTime?> lastActiveDate = const Value.absent(),
    Value<DateTime?> lastCheckInDate = const Value.absent(),
    bool? checkedInToday,
    int? prePainScore,
    Value<DateTime?> programStartDate = const Value.absent(),
  }) => JourneyMetaRow(
    id: id ?? this.id,
    currentDay: currentDay ?? this.currentDay,
    lastActiveDate: lastActiveDate.present
        ? lastActiveDate.value
        : this.lastActiveDate,
    lastCheckInDate: lastCheckInDate.present
        ? lastCheckInDate.value
        : this.lastCheckInDate,
    checkedInToday: checkedInToday ?? this.checkedInToday,
    prePainScore: prePainScore ?? this.prePainScore,
    programStartDate: programStartDate.present
        ? programStartDate.value
        : this.programStartDate,
  );
  JourneyMetaRow copyWithCompanion(JourneyMetaRowsCompanion data) {
    return JourneyMetaRow(
      id: data.id.present ? data.id.value : this.id,
      currentDay: data.currentDay.present
          ? data.currentDay.value
          : this.currentDay,
      lastActiveDate: data.lastActiveDate.present
          ? data.lastActiveDate.value
          : this.lastActiveDate,
      lastCheckInDate: data.lastCheckInDate.present
          ? data.lastCheckInDate.value
          : this.lastCheckInDate,
      checkedInToday: data.checkedInToday.present
          ? data.checkedInToday.value
          : this.checkedInToday,
      prePainScore: data.prePainScore.present
          ? data.prePainScore.value
          : this.prePainScore,
      programStartDate: data.programStartDate.present
          ? data.programStartDate.value
          : this.programStartDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JourneyMetaRow(')
          ..write('id: $id, ')
          ..write('currentDay: $currentDay, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('lastCheckInDate: $lastCheckInDate, ')
          ..write('checkedInToday: $checkedInToday, ')
          ..write('prePainScore: $prePainScore, ')
          ..write('programStartDate: $programStartDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    currentDay,
    lastActiveDate,
    lastCheckInDate,
    checkedInToday,
    prePainScore,
    programStartDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JourneyMetaRow &&
          other.id == this.id &&
          other.currentDay == this.currentDay &&
          other.lastActiveDate == this.lastActiveDate &&
          other.lastCheckInDate == this.lastCheckInDate &&
          other.checkedInToday == this.checkedInToday &&
          other.prePainScore == this.prePainScore &&
          other.programStartDate == this.programStartDate);
}

class JourneyMetaRowsCompanion extends UpdateCompanion<JourneyMetaRow> {
  final Value<int> id;
  final Value<int> currentDay;
  final Value<DateTime?> lastActiveDate;
  final Value<DateTime?> lastCheckInDate;
  final Value<bool> checkedInToday;
  final Value<int> prePainScore;
  final Value<DateTime?> programStartDate;
  const JourneyMetaRowsCompanion({
    this.id = const Value.absent(),
    this.currentDay = const Value.absent(),
    this.lastActiveDate = const Value.absent(),
    this.lastCheckInDate = const Value.absent(),
    this.checkedInToday = const Value.absent(),
    this.prePainScore = const Value.absent(),
    this.programStartDate = const Value.absent(),
  });
  JourneyMetaRowsCompanion.insert({
    this.id = const Value.absent(),
    this.currentDay = const Value.absent(),
    this.lastActiveDate = const Value.absent(),
    this.lastCheckInDate = const Value.absent(),
    this.checkedInToday = const Value.absent(),
    this.prePainScore = const Value.absent(),
    this.programStartDate = const Value.absent(),
  });
  static Insertable<JourneyMetaRow> custom({
    Expression<int>? id,
    Expression<int>? currentDay,
    Expression<DateTime>? lastActiveDate,
    Expression<DateTime>? lastCheckInDate,
    Expression<bool>? checkedInToday,
    Expression<int>? prePainScore,
    Expression<DateTime>? programStartDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentDay != null) 'current_day': currentDay,
      if (lastActiveDate != null) 'last_active_date': lastActiveDate,
      if (lastCheckInDate != null) 'last_check_in_date': lastCheckInDate,
      if (checkedInToday != null) 'checked_in_today': checkedInToday,
      if (prePainScore != null) 'pre_pain_score': prePainScore,
      if (programStartDate != null) 'program_start_date': programStartDate,
    });
  }

  JourneyMetaRowsCompanion copyWith({
    Value<int>? id,
    Value<int>? currentDay,
    Value<DateTime?>? lastActiveDate,
    Value<DateTime?>? lastCheckInDate,
    Value<bool>? checkedInToday,
    Value<int>? prePainScore,
    Value<DateTime?>? programStartDate,
  }) {
    return JourneyMetaRowsCompanion(
      id: id ?? this.id,
      currentDay: currentDay ?? this.currentDay,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      lastCheckInDate: lastCheckInDate ?? this.lastCheckInDate,
      checkedInToday: checkedInToday ?? this.checkedInToday,
      prePainScore: prePainScore ?? this.prePainScore,
      programStartDate: programStartDate ?? this.programStartDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentDay.present) {
      map['current_day'] = Variable<int>(currentDay.value);
    }
    if (lastActiveDate.present) {
      map['last_active_date'] = Variable<DateTime>(lastActiveDate.value);
    }
    if (lastCheckInDate.present) {
      map['last_check_in_date'] = Variable<DateTime>(lastCheckInDate.value);
    }
    if (checkedInToday.present) {
      map['checked_in_today'] = Variable<bool>(checkedInToday.value);
    }
    if (prePainScore.present) {
      map['pre_pain_score'] = Variable<int>(prePainScore.value);
    }
    if (programStartDate.present) {
      map['program_start_date'] = Variable<DateTime>(programStartDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JourneyMetaRowsCompanion(')
          ..write('id: $id, ')
          ..write('currentDay: $currentDay, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('lastCheckInDate: $lastCheckInDate, ')
          ..write('checkedInToday: $checkedInToday, ')
          ..write('prePainScore: $prePainScore, ')
          ..write('programStartDate: $programStartDate')
          ..write(')'))
        .toString();
  }
}

class $JourneyCompletedDayRowsTable extends JourneyCompletedDayRows
    with TableInfo<$JourneyCompletedDayRowsTable, JourneyCompletedDayRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JourneyCompletedDayRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [day];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journey_completed_day_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<JourneyCompletedDayRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {day};
  @override
  JourneyCompletedDayRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JourneyCompletedDayRow(
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
    );
  }

  @override
  $JourneyCompletedDayRowsTable createAlias(String alias) {
    return $JourneyCompletedDayRowsTable(attachedDatabase, alias);
  }
}

class JourneyCompletedDayRow extends DataClass
    implements Insertable<JourneyCompletedDayRow> {
  final int day;
  const JourneyCompletedDayRow({required this.day});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<int>(day);
    return map;
  }

  JourneyCompletedDayRowsCompanion toCompanion(bool nullToAbsent) {
    return JourneyCompletedDayRowsCompanion(day: Value(day));
  }

  factory JourneyCompletedDayRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JourneyCompletedDayRow(day: serializer.fromJson<int>(json['day']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'day': serializer.toJson<int>(day)};
  }

  JourneyCompletedDayRow copyWith({int? day}) =>
      JourneyCompletedDayRow(day: day ?? this.day);
  JourneyCompletedDayRow copyWithCompanion(
    JourneyCompletedDayRowsCompanion data,
  ) {
    return JourneyCompletedDayRow(
      day: data.day.present ? data.day.value : this.day,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JourneyCompletedDayRow(')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => day.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JourneyCompletedDayRow && other.day == this.day);
}

class JourneyCompletedDayRowsCompanion
    extends UpdateCompanion<JourneyCompletedDayRow> {
  final Value<int> day;
  const JourneyCompletedDayRowsCompanion({this.day = const Value.absent()});
  JourneyCompletedDayRowsCompanion.insert({this.day = const Value.absent()});
  static Insertable<JourneyCompletedDayRow> custom({Expression<int>? day}) {
    return RawValuesInsertable({if (day != null) 'day': day});
  }

  JourneyCompletedDayRowsCompanion copyWith({Value<int>? day}) {
    return JourneyCompletedDayRowsCompanion(day: day ?? this.day);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JourneyCompletedDayRowsCompanion(')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }
}

class $DailyCompletedSessionRowsTable extends DailyCompletedSessionRows
    with TableInfo<$DailyCompletedSessionRowsTable, DailyCompletedSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyCompletedSessionRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [sessionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_completed_session_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyCompletedSessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  DailyCompletedSessionRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyCompletedSessionRow(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
    );
  }

  @override
  $DailyCompletedSessionRowsTable createAlias(String alias) {
    return $DailyCompletedSessionRowsTable(attachedDatabase, alias);
  }
}

class DailyCompletedSessionRow extends DataClass
    implements Insertable<DailyCompletedSessionRow> {
  final String sessionId;
  const DailyCompletedSessionRow({required this.sessionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    return map;
  }

  DailyCompletedSessionRowsCompanion toCompanion(bool nullToAbsent) {
    return DailyCompletedSessionRowsCompanion(sessionId: Value(sessionId));
  }

  factory DailyCompletedSessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyCompletedSessionRow(
      sessionId: serializer.fromJson<String>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'sessionId': serializer.toJson<String>(sessionId)};
  }

  DailyCompletedSessionRow copyWith({String? sessionId}) =>
      DailyCompletedSessionRow(sessionId: sessionId ?? this.sessionId);
  DailyCompletedSessionRow copyWithCompanion(
    DailyCompletedSessionRowsCompanion data,
  ) {
    return DailyCompletedSessionRow(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyCompletedSessionRow(')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => sessionId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyCompletedSessionRow && other.sessionId == this.sessionId);
}

class DailyCompletedSessionRowsCompanion
    extends UpdateCompanion<DailyCompletedSessionRow> {
  final Value<String> sessionId;
  final Value<int> rowid;
  const DailyCompletedSessionRowsCompanion({
    this.sessionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyCompletedSessionRowsCompanion.insert({
    required String sessionId,
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId);
  static Insertable<DailyCompletedSessionRow> custom({
    Expression<String>? sessionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyCompletedSessionRowsCompanion copyWith({
    Value<String>? sessionId,
    Value<int>? rowid,
  }) {
    return DailyCompletedSessionRowsCompanion(
      sessionId: sessionId ?? this.sessionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyCompletedSessionRowsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnlockedAchievementRowsTable extends UnlockedAchievementRows
    with TableInfo<$UnlockedAchievementRowsTable, UnlockedAchievementRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnlockedAchievementRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _achievementIdMeta = const VerificationMeta(
    'achievementId',
  );
  @override
  late final GeneratedColumn<String> achievementId = GeneratedColumn<String>(
    'achievement_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [achievementId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unlocked_achievement_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnlockedAchievementRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('achievement_id')) {
      context.handle(
        _achievementIdMeta,
        achievementId.isAcceptableOrUnknown(
          data['achievement_id']!,
          _achievementIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {achievementId};
  @override
  UnlockedAchievementRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnlockedAchievementRow(
      achievementId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_id'],
      )!,
    );
  }

  @override
  $UnlockedAchievementRowsTable createAlias(String alias) {
    return $UnlockedAchievementRowsTable(attachedDatabase, alias);
  }
}

class UnlockedAchievementRow extends DataClass
    implements Insertable<UnlockedAchievementRow> {
  final String achievementId;
  const UnlockedAchievementRow({required this.achievementId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['achievement_id'] = Variable<String>(achievementId);
    return map;
  }

  UnlockedAchievementRowsCompanion toCompanion(bool nullToAbsent) {
    return UnlockedAchievementRowsCompanion(
      achievementId: Value(achievementId),
    );
  }

  factory UnlockedAchievementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnlockedAchievementRow(
      achievementId: serializer.fromJson<String>(json['achievementId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'achievementId': serializer.toJson<String>(achievementId),
    };
  }

  UnlockedAchievementRow copyWith({String? achievementId}) =>
      UnlockedAchievementRow(
        achievementId: achievementId ?? this.achievementId,
      );
  UnlockedAchievementRow copyWithCompanion(
    UnlockedAchievementRowsCompanion data,
  ) {
    return UnlockedAchievementRow(
      achievementId: data.achievementId.present
          ? data.achievementId.value
          : this.achievementId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedAchievementRow(')
          ..write('achievementId: $achievementId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => achievementId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnlockedAchievementRow &&
          other.achievementId == this.achievementId);
}

class UnlockedAchievementRowsCompanion
    extends UpdateCompanion<UnlockedAchievementRow> {
  final Value<String> achievementId;
  final Value<int> rowid;
  const UnlockedAchievementRowsCompanion({
    this.achievementId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnlockedAchievementRowsCompanion.insert({
    required String achievementId,
    this.rowid = const Value.absent(),
  }) : achievementId = Value(achievementId);
  static Insertable<UnlockedAchievementRow> custom({
    Expression<String>? achievementId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (achievementId != null) 'achievement_id': achievementId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnlockedAchievementRowsCompanion copyWith({
    Value<String>? achievementId,
    Value<int>? rowid,
  }) {
    return UnlockedAchievementRowsCompanion(
      achievementId: achievementId ?? this.achievementId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (achievementId.present) {
      map['achievement_id'] = Variable<String>(achievementId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedAchievementRowsCompanion(')
          ..write('achievementId: $achievementId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeenMilestoneRowsTable extends SeenMilestoneRows
    with TableInfo<$SeenMilestoneRowsTable, SeenMilestoneRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeenMilestoneRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [day];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'seen_milestone_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<SeenMilestoneRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {day};
  @override
  SeenMilestoneRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SeenMilestoneRow(
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day'],
      )!,
    );
  }

  @override
  $SeenMilestoneRowsTable createAlias(String alias) {
    return $SeenMilestoneRowsTable(attachedDatabase, alias);
  }
}

class SeenMilestoneRow extends DataClass
    implements Insertable<SeenMilestoneRow> {
  final int day;
  const SeenMilestoneRow({required this.day});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day'] = Variable<int>(day);
    return map;
  }

  SeenMilestoneRowsCompanion toCompanion(bool nullToAbsent) {
    return SeenMilestoneRowsCompanion(day: Value(day));
  }

  factory SeenMilestoneRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SeenMilestoneRow(day: serializer.fromJson<int>(json['day']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'day': serializer.toJson<int>(day)};
  }

  SeenMilestoneRow copyWith({int? day}) =>
      SeenMilestoneRow(day: day ?? this.day);
  SeenMilestoneRow copyWithCompanion(SeenMilestoneRowsCompanion data) {
    return SeenMilestoneRow(day: data.day.present ? data.day.value : this.day);
  }

  @override
  String toString() {
    return (StringBuffer('SeenMilestoneRow(')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => day.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SeenMilestoneRow && other.day == this.day);
}

class SeenMilestoneRowsCompanion extends UpdateCompanion<SeenMilestoneRow> {
  final Value<int> day;
  const SeenMilestoneRowsCompanion({this.day = const Value.absent()});
  SeenMilestoneRowsCompanion.insert({this.day = const Value.absent()});
  static Insertable<SeenMilestoneRow> custom({Expression<int>? day}) {
    return RawValuesInsertable({if (day != null) 'day': day});
  }

  SeenMilestoneRowsCompanion copyWith({Value<int>? day}) {
    return SeenMilestoneRowsCompanion(day: day ?? this.day);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeenMilestoneRowsCompanion(')
          ..write('day: $day')
          ..write(')'))
        .toString();
  }
}

class $MobilityScoreRowsTable extends MobilityScoreRows
    with TableInfo<$MobilityScoreRowsTable, MobilityScoreRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MobilityScoreRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overallMeta = const VerificationMeta(
    'overall',
  );
  @override
  late final GeneratedColumn<int> overall = GeneratedColumn<int>(
    'overall',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaScoresJsonMeta = const VerificationMeta(
    'areaScoresJson',
  );
  @override
  late final GeneratedColumn<String> areaScoresJson = GeneratedColumn<String>(
    'area_scores_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, overall, areaScoresJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mobility_score_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<MobilityScoreRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('overall')) {
      context.handle(
        _overallMeta,
        overall.isAcceptableOrUnknown(data['overall']!, _overallMeta),
      );
    } else if (isInserting) {
      context.missing(_overallMeta);
    }
    if (data.containsKey('area_scores_json')) {
      context.handle(
        _areaScoresJsonMeta,
        areaScoresJson.isAcceptableOrUnknown(
          data['area_scores_json']!,
          _areaScoresJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_areaScoresJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MobilityScoreRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MobilityScoreRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      overall: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}overall'],
      )!,
      areaScoresJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_scores_json'],
      )!,
    );
  }

  @override
  $MobilityScoreRowsTable createAlias(String alias) {
    return $MobilityScoreRowsTable(attachedDatabase, alias);
  }
}

class MobilityScoreRow extends DataClass
    implements Insertable<MobilityScoreRow> {
  final int id;
  final int overall;
  final String areaScoresJson;
  const MobilityScoreRow({
    required this.id,
    required this.overall,
    required this.areaScoresJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['overall'] = Variable<int>(overall);
    map['area_scores_json'] = Variable<String>(areaScoresJson);
    return map;
  }

  MobilityScoreRowsCompanion toCompanion(bool nullToAbsent) {
    return MobilityScoreRowsCompanion(
      id: Value(id),
      overall: Value(overall),
      areaScoresJson: Value(areaScoresJson),
    );
  }

  factory MobilityScoreRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MobilityScoreRow(
      id: serializer.fromJson<int>(json['id']),
      overall: serializer.fromJson<int>(json['overall']),
      areaScoresJson: serializer.fromJson<String>(json['areaScoresJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'overall': serializer.toJson<int>(overall),
      'areaScoresJson': serializer.toJson<String>(areaScoresJson),
    };
  }

  MobilityScoreRow copyWith({int? id, int? overall, String? areaScoresJson}) =>
      MobilityScoreRow(
        id: id ?? this.id,
        overall: overall ?? this.overall,
        areaScoresJson: areaScoresJson ?? this.areaScoresJson,
      );
  MobilityScoreRow copyWithCompanion(MobilityScoreRowsCompanion data) {
    return MobilityScoreRow(
      id: data.id.present ? data.id.value : this.id,
      overall: data.overall.present ? data.overall.value : this.overall,
      areaScoresJson: data.areaScoresJson.present
          ? data.areaScoresJson.value
          : this.areaScoresJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MobilityScoreRow(')
          ..write('id: $id, ')
          ..write('overall: $overall, ')
          ..write('areaScoresJson: $areaScoresJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, overall, areaScoresJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MobilityScoreRow &&
          other.id == this.id &&
          other.overall == this.overall &&
          other.areaScoresJson == this.areaScoresJson);
}

class MobilityScoreRowsCompanion extends UpdateCompanion<MobilityScoreRow> {
  final Value<int> id;
  final Value<int> overall;
  final Value<String> areaScoresJson;
  const MobilityScoreRowsCompanion({
    this.id = const Value.absent(),
    this.overall = const Value.absent(),
    this.areaScoresJson = const Value.absent(),
  });
  MobilityScoreRowsCompanion.insert({
    this.id = const Value.absent(),
    required int overall,
    required String areaScoresJson,
  }) : overall = Value(overall),
       areaScoresJson = Value(areaScoresJson);
  static Insertable<MobilityScoreRow> custom({
    Expression<int>? id,
    Expression<int>? overall,
    Expression<String>? areaScoresJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (overall != null) 'overall': overall,
      if (areaScoresJson != null) 'area_scores_json': areaScoresJson,
    });
  }

  MobilityScoreRowsCompanion copyWith({
    Value<int>? id,
    Value<int>? overall,
    Value<String>? areaScoresJson,
  }) {
    return MobilityScoreRowsCompanion(
      id: id ?? this.id,
      overall: overall ?? this.overall,
      areaScoresJson: areaScoresJson ?? this.areaScoresJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (overall.present) {
      map['overall'] = Variable<int>(overall.value);
    }
    if (areaScoresJson.present) {
      map['area_scores_json'] = Variable<String>(areaScoresJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MobilityScoreRowsCompanion(')
          ..write('id: $id, ')
          ..write('overall: $overall, ')
          ..write('areaScoresJson: $areaScoresJson')
          ..write(')'))
        .toString();
  }
}

class $PostureAnalysisRowsTable extends PostureAnalysisRows
    with TableInfo<$PostureAnalysisRowsTable, PostureAnalysisRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostureAnalysisRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issuesJsonMeta = const VerificationMeta(
    'issuesJson',
  );
  @override
  late final GeneratedColumn<String> issuesJson = GeneratedColumn<String>(
    'issues_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recommendationsJsonMeta =
      const VerificationMeta('recommendationsJson');
  @override
  late final GeneratedColumn<String> recommendationsJson =
      GeneratedColumn<String>(
        'recommendations_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _deskTipsJsonMeta = const VerificationMeta(
    'deskTipsJson',
  );
  @override
  late final GeneratedColumn<String> deskTipsJson = GeneratedColumn<String>(
    'desk_tips_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    issuesJson,
    score,
    summary,
    recommendationsJson,
    deskTipsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'posture_analysis_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<PostureAnalysisRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('issues_json')) {
      context.handle(
        _issuesJsonMeta,
        issuesJson.isAcceptableOrUnknown(data['issues_json']!, _issuesJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_issuesJsonMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('recommendations_json')) {
      context.handle(
        _recommendationsJsonMeta,
        recommendationsJson.isAcceptableOrUnknown(
          data['recommendations_json']!,
          _recommendationsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recommendationsJsonMeta);
    }
    if (data.containsKey('desk_tips_json')) {
      context.handle(
        _deskTipsJsonMeta,
        deskTipsJson.isAcceptableOrUnknown(
          data['desk_tips_json']!,
          _deskTipsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deskTipsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostureAnalysisRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostureAnalysisRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      issuesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}issues_json'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      recommendationsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recommendations_json'],
      )!,
      deskTipsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desk_tips_json'],
      )!,
    );
  }

  @override
  $PostureAnalysisRowsTable createAlias(String alias) {
    return $PostureAnalysisRowsTable(attachedDatabase, alias);
  }
}

class PostureAnalysisRow extends DataClass
    implements Insertable<PostureAnalysisRow> {
  final String id;
  final DateTime createdAt;
  final String issuesJson;
  final int score;
  final String summary;
  final String recommendationsJson;
  final String deskTipsJson;
  const PostureAnalysisRow({
    required this.id,
    required this.createdAt,
    required this.issuesJson,
    required this.score,
    required this.summary,
    required this.recommendationsJson,
    required this.deskTipsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['issues_json'] = Variable<String>(issuesJson);
    map['score'] = Variable<int>(score);
    map['summary'] = Variable<String>(summary);
    map['recommendations_json'] = Variable<String>(recommendationsJson);
    map['desk_tips_json'] = Variable<String>(deskTipsJson);
    return map;
  }

  PostureAnalysisRowsCompanion toCompanion(bool nullToAbsent) {
    return PostureAnalysisRowsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      issuesJson: Value(issuesJson),
      score: Value(score),
      summary: Value(summary),
      recommendationsJson: Value(recommendationsJson),
      deskTipsJson: Value(deskTipsJson),
    );
  }

  factory PostureAnalysisRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostureAnalysisRow(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      issuesJson: serializer.fromJson<String>(json['issuesJson']),
      score: serializer.fromJson<int>(json['score']),
      summary: serializer.fromJson<String>(json['summary']),
      recommendationsJson: serializer.fromJson<String>(
        json['recommendationsJson'],
      ),
      deskTipsJson: serializer.fromJson<String>(json['deskTipsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'issuesJson': serializer.toJson<String>(issuesJson),
      'score': serializer.toJson<int>(score),
      'summary': serializer.toJson<String>(summary),
      'recommendationsJson': serializer.toJson<String>(recommendationsJson),
      'deskTipsJson': serializer.toJson<String>(deskTipsJson),
    };
  }

  PostureAnalysisRow copyWith({
    String? id,
    DateTime? createdAt,
    String? issuesJson,
    int? score,
    String? summary,
    String? recommendationsJson,
    String? deskTipsJson,
  }) => PostureAnalysisRow(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    issuesJson: issuesJson ?? this.issuesJson,
    score: score ?? this.score,
    summary: summary ?? this.summary,
    recommendationsJson: recommendationsJson ?? this.recommendationsJson,
    deskTipsJson: deskTipsJson ?? this.deskTipsJson,
  );
  PostureAnalysisRow copyWithCompanion(PostureAnalysisRowsCompanion data) {
    return PostureAnalysisRow(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      issuesJson: data.issuesJson.present
          ? data.issuesJson.value
          : this.issuesJson,
      score: data.score.present ? data.score.value : this.score,
      summary: data.summary.present ? data.summary.value : this.summary,
      recommendationsJson: data.recommendationsJson.present
          ? data.recommendationsJson.value
          : this.recommendationsJson,
      deskTipsJson: data.deskTipsJson.present
          ? data.deskTipsJson.value
          : this.deskTipsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostureAnalysisRow(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('issuesJson: $issuesJson, ')
          ..write('score: $score, ')
          ..write('summary: $summary, ')
          ..write('recommendationsJson: $recommendationsJson, ')
          ..write('deskTipsJson: $deskTipsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    issuesJson,
    score,
    summary,
    recommendationsJson,
    deskTipsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostureAnalysisRow &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.issuesJson == this.issuesJson &&
          other.score == this.score &&
          other.summary == this.summary &&
          other.recommendationsJson == this.recommendationsJson &&
          other.deskTipsJson == this.deskTipsJson);
}

class PostureAnalysisRowsCompanion extends UpdateCompanion<PostureAnalysisRow> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> issuesJson;
  final Value<int> score;
  final Value<String> summary;
  final Value<String> recommendationsJson;
  final Value<String> deskTipsJson;
  final Value<int> rowid;
  const PostureAnalysisRowsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.issuesJson = const Value.absent(),
    this.score = const Value.absent(),
    this.summary = const Value.absent(),
    this.recommendationsJson = const Value.absent(),
    this.deskTipsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PostureAnalysisRowsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required String issuesJson,
    required int score,
    required String summary,
    required String recommendationsJson,
    required String deskTipsJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       issuesJson = Value(issuesJson),
       score = Value(score),
       summary = Value(summary),
       recommendationsJson = Value(recommendationsJson),
       deskTipsJson = Value(deskTipsJson);
  static Insertable<PostureAnalysisRow> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? issuesJson,
    Expression<int>? score,
    Expression<String>? summary,
    Expression<String>? recommendationsJson,
    Expression<String>? deskTipsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (issuesJson != null) 'issues_json': issuesJson,
      if (score != null) 'score': score,
      if (summary != null) 'summary': summary,
      if (recommendationsJson != null)
        'recommendations_json': recommendationsJson,
      if (deskTipsJson != null) 'desk_tips_json': deskTipsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PostureAnalysisRowsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<String>? issuesJson,
    Value<int>? score,
    Value<String>? summary,
    Value<String>? recommendationsJson,
    Value<String>? deskTipsJson,
    Value<int>? rowid,
  }) {
    return PostureAnalysisRowsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      issuesJson: issuesJson ?? this.issuesJson,
      score: score ?? this.score,
      summary: summary ?? this.summary,
      recommendationsJson: recommendationsJson ?? this.recommendationsJson,
      deskTipsJson: deskTipsJson ?? this.deskTipsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (issuesJson.present) {
      map['issues_json'] = Variable<String>(issuesJson.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (recommendationsJson.present) {
      map['recommendations_json'] = Variable<String>(recommendationsJson.value);
    }
    if (deskTipsJson.present) {
      map['desk_tips_json'] = Variable<String>(deskTipsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostureAnalysisRowsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('issuesJson: $issuesJson, ')
          ..write('score: $score, ')
          ..write('summary: $summary, ')
          ..write('recommendationsJson: $recommendationsJson, ')
          ..write('deskTipsJson: $deskTipsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiDailyPlanRowsTable extends AiDailyPlanRows
    with TableInfo<$AiDailyPlanRowsTable, AiDailyPlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiDailyPlanRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusMeta = const VerificationMeta('focus');
  @override
  late final GeneratedColumn<String> focus = GeneratedColumn<String>(
    'focus',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _morningMeta = const VerificationMeta(
    'morning',
  );
  @override
  late final GeneratedColumn<String> morning = GeneratedColumn<String>(
    'morning',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _middayMeta = const VerificationMeta('midday');
  @override
  late final GeneratedColumn<String> midday = GeneratedColumn<String>(
    'midday',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eveningMeta = const VerificationMeta(
    'evening',
  );
  @override
  late final GeneratedColumn<String> evening = GeneratedColumn<String>(
    'evening',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coachNoteMeta = const VerificationMeta(
    'coachNote',
  );
  @override
  late final GeneratedColumn<String> coachNote = GeneratedColumn<String>(
    'coach_note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    generatedAt,
    focus,
    morning,
    midday,
    evening,
    coachNote,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ai_daily_plan_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<AiDailyPlanRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('focus')) {
      context.handle(
        _focusMeta,
        focus.isAcceptableOrUnknown(data['focus']!, _focusMeta),
      );
    } else if (isInserting) {
      context.missing(_focusMeta);
    }
    if (data.containsKey('morning')) {
      context.handle(
        _morningMeta,
        morning.isAcceptableOrUnknown(data['morning']!, _morningMeta),
      );
    } else if (isInserting) {
      context.missing(_morningMeta);
    }
    if (data.containsKey('midday')) {
      context.handle(
        _middayMeta,
        midday.isAcceptableOrUnknown(data['midday']!, _middayMeta),
      );
    } else if (isInserting) {
      context.missing(_middayMeta);
    }
    if (data.containsKey('evening')) {
      context.handle(
        _eveningMeta,
        evening.isAcceptableOrUnknown(data['evening']!, _eveningMeta),
      );
    } else if (isInserting) {
      context.missing(_eveningMeta);
    }
    if (data.containsKey('coach_note')) {
      context.handle(
        _coachNoteMeta,
        coachNote.isAcceptableOrUnknown(data['coach_note']!, _coachNoteMeta),
      );
    } else if (isInserting) {
      context.missing(_coachNoteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiDailyPlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiDailyPlanRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      focus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus'],
      )!,
      morning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}morning'],
      )!,
      midday: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}midday'],
      )!,
      evening: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evening'],
      )!,
      coachNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coach_note'],
      )!,
    );
  }

  @override
  $AiDailyPlanRowsTable createAlias(String alias) {
    return $AiDailyPlanRowsTable(attachedDatabase, alias);
  }
}

class AiDailyPlanRow extends DataClass implements Insertable<AiDailyPlanRow> {
  final int id;
  final DateTime generatedAt;
  final String focus;
  final String morning;
  final String midday;
  final String evening;
  final String coachNote;
  const AiDailyPlanRow({
    required this.id,
    required this.generatedAt,
    required this.focus,
    required this.morning,
    required this.midday,
    required this.evening,
    required this.coachNote,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['focus'] = Variable<String>(focus);
    map['morning'] = Variable<String>(morning);
    map['midday'] = Variable<String>(midday);
    map['evening'] = Variable<String>(evening);
    map['coach_note'] = Variable<String>(coachNote);
    return map;
  }

  AiDailyPlanRowsCompanion toCompanion(bool nullToAbsent) {
    return AiDailyPlanRowsCompanion(
      id: Value(id),
      generatedAt: Value(generatedAt),
      focus: Value(focus),
      morning: Value(morning),
      midday: Value(midday),
      evening: Value(evening),
      coachNote: Value(coachNote),
    );
  }

  factory AiDailyPlanRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiDailyPlanRow(
      id: serializer.fromJson<int>(json['id']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      focus: serializer.fromJson<String>(json['focus']),
      morning: serializer.fromJson<String>(json['morning']),
      midday: serializer.fromJson<String>(json['midday']),
      evening: serializer.fromJson<String>(json['evening']),
      coachNote: serializer.fromJson<String>(json['coachNote']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'focus': serializer.toJson<String>(focus),
      'morning': serializer.toJson<String>(morning),
      'midday': serializer.toJson<String>(midday),
      'evening': serializer.toJson<String>(evening),
      'coachNote': serializer.toJson<String>(coachNote),
    };
  }

  AiDailyPlanRow copyWith({
    int? id,
    DateTime? generatedAt,
    String? focus,
    String? morning,
    String? midday,
    String? evening,
    String? coachNote,
  }) => AiDailyPlanRow(
    id: id ?? this.id,
    generatedAt: generatedAt ?? this.generatedAt,
    focus: focus ?? this.focus,
    morning: morning ?? this.morning,
    midday: midday ?? this.midday,
    evening: evening ?? this.evening,
    coachNote: coachNote ?? this.coachNote,
  );
  AiDailyPlanRow copyWithCompanion(AiDailyPlanRowsCompanion data) {
    return AiDailyPlanRow(
      id: data.id.present ? data.id.value : this.id,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      focus: data.focus.present ? data.focus.value : this.focus,
      morning: data.morning.present ? data.morning.value : this.morning,
      midday: data.midday.present ? data.midday.value : this.midday,
      evening: data.evening.present ? data.evening.value : this.evening,
      coachNote: data.coachNote.present ? data.coachNote.value : this.coachNote,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiDailyPlanRow(')
          ..write('id: $id, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('focus: $focus, ')
          ..write('morning: $morning, ')
          ..write('midday: $midday, ')
          ..write('evening: $evening, ')
          ..write('coachNote: $coachNote')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, generatedAt, focus, morning, midday, evening, coachNote);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiDailyPlanRow &&
          other.id == this.id &&
          other.generatedAt == this.generatedAt &&
          other.focus == this.focus &&
          other.morning == this.morning &&
          other.midday == this.midday &&
          other.evening == this.evening &&
          other.coachNote == this.coachNote);
}

class AiDailyPlanRowsCompanion extends UpdateCompanion<AiDailyPlanRow> {
  final Value<int> id;
  final Value<DateTime> generatedAt;
  final Value<String> focus;
  final Value<String> morning;
  final Value<String> midday;
  final Value<String> evening;
  final Value<String> coachNote;
  const AiDailyPlanRowsCompanion({
    this.id = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.focus = const Value.absent(),
    this.morning = const Value.absent(),
    this.midday = const Value.absent(),
    this.evening = const Value.absent(),
    this.coachNote = const Value.absent(),
  });
  AiDailyPlanRowsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime generatedAt,
    required String focus,
    required String morning,
    required String midday,
    required String evening,
    required String coachNote,
  }) : generatedAt = Value(generatedAt),
       focus = Value(focus),
       morning = Value(morning),
       midday = Value(midday),
       evening = Value(evening),
       coachNote = Value(coachNote);
  static Insertable<AiDailyPlanRow> custom({
    Expression<int>? id,
    Expression<DateTime>? generatedAt,
    Expression<String>? focus,
    Expression<String>? morning,
    Expression<String>? midday,
    Expression<String>? evening,
    Expression<String>? coachNote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (focus != null) 'focus': focus,
      if (morning != null) 'morning': morning,
      if (midday != null) 'midday': midday,
      if (evening != null) 'evening': evening,
      if (coachNote != null) 'coach_note': coachNote,
    });
  }

  AiDailyPlanRowsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? generatedAt,
    Value<String>? focus,
    Value<String>? morning,
    Value<String>? midday,
    Value<String>? evening,
    Value<String>? coachNote,
  }) {
    return AiDailyPlanRowsCompanion(
      id: id ?? this.id,
      generatedAt: generatedAt ?? this.generatedAt,
      focus: focus ?? this.focus,
      morning: morning ?? this.morning,
      midday: midday ?? this.midday,
      evening: evening ?? this.evening,
      coachNote: coachNote ?? this.coachNote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (focus.present) {
      map['focus'] = Variable<String>(focus.value);
    }
    if (morning.present) {
      map['morning'] = Variable<String>(morning.value);
    }
    if (midday.present) {
      map['midday'] = Variable<String>(midday.value);
    }
    if (evening.present) {
      map['evening'] = Variable<String>(evening.value);
    }
    if (coachNote.present) {
      map['coach_note'] = Variable<String>(coachNote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiDailyPlanRowsCompanion(')
          ..write('id: $id, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('focus: $focus, ')
          ..write('morning: $morning, ')
          ..write('midday: $midday, ')
          ..write('evening: $evening, ')
          ..write('coachNote: $coachNote')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsRowsTable extends AppSettingsRows
    with TableInfo<$AppSettingsRowsTable, AppSettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _workoutMoodMeta = const VerificationMeta(
    'workoutMood',
  );
  @override
  late final GeneratedColumn<String> workoutMood = GeneratedColumn<String>(
    'workout_mood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodSoundEnabledMeta = const VerificationMeta(
    'moodSoundEnabled',
  );
  @override
  late final GeneratedColumn<bool> moodSoundEnabled = GeneratedColumn<bool>(
    'mood_sound_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("mood_sound_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _premiumPlanMeta = const VerificationMeta(
    'premiumPlan',
  );
  @override
  late final GeneratedColumn<String> premiumPlan = GeneratedColumn<String>(
    'premium_plan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _premiumSinceMeta = const VerificationMeta(
    'premiumSince',
  );
  @override
  late final GeneratedColumn<DateTime> premiumSince = GeneratedColumn<DateTime>(
    'premium_since',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    themeMode,
    workoutMood,
    moodSoundEnabled,
    notificationsEnabled,
    premiumPlan,
    premiumSince,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('workout_mood')) {
      context.handle(
        _workoutMoodMeta,
        workoutMood.isAcceptableOrUnknown(
          data['workout_mood']!,
          _workoutMoodMeta,
        ),
      );
    }
    if (data.containsKey('mood_sound_enabled')) {
      context.handle(
        _moodSoundEnabledMeta,
        moodSoundEnabled.isAcceptableOrUnknown(
          data['mood_sound_enabled']!,
          _moodSoundEnabledMeta,
        ),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('premium_plan')) {
      context.handle(
        _premiumPlanMeta,
        premiumPlan.isAcceptableOrUnknown(
          data['premium_plan']!,
          _premiumPlanMeta,
        ),
      );
    }
    if (data.containsKey('premium_since')) {
      context.handle(
        _premiumSinceMeta,
        premiumSince.isAcceptableOrUnknown(
          data['premium_since']!,
          _premiumSinceMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      workoutMood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_mood'],
      ),
      moodSoundEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}mood_sound_enabled'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      premiumPlan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}premium_plan'],
      ),
      premiumSince: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}premium_since'],
      ),
    );
  }

  @override
  $AppSettingsRowsTable createAlias(String alias) {
    return $AppSettingsRowsTable(attachedDatabase, alias);
  }
}

class AppSettingsRow extends DataClass implements Insertable<AppSettingsRow> {
  final int id;
  final String themeMode;
  final String? workoutMood;
  final bool moodSoundEnabled;
  final bool notificationsEnabled;
  final String? premiumPlan;
  final DateTime? premiumSince;
  const AppSettingsRow({
    required this.id,
    required this.themeMode,
    this.workoutMood,
    required this.moodSoundEnabled,
    required this.notificationsEnabled,
    this.premiumPlan,
    this.premiumSince,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme_mode'] = Variable<String>(themeMode);
    if (!nullToAbsent || workoutMood != null) {
      map['workout_mood'] = Variable<String>(workoutMood);
    }
    map['mood_sound_enabled'] = Variable<bool>(moodSoundEnabled);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    if (!nullToAbsent || premiumPlan != null) {
      map['premium_plan'] = Variable<String>(premiumPlan);
    }
    if (!nullToAbsent || premiumSince != null) {
      map['premium_since'] = Variable<DateTime>(premiumSince);
    }
    return map;
  }

  AppSettingsRowsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsRowsCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      workoutMood: workoutMood == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutMood),
      moodSoundEnabled: Value(moodSoundEnabled),
      notificationsEnabled: Value(notificationsEnabled),
      premiumPlan: premiumPlan == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumPlan),
      premiumSince: premiumSince == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumSince),
    );
  }

  factory AppSettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsRow(
      id: serializer.fromJson<int>(json['id']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      workoutMood: serializer.fromJson<String?>(json['workoutMood']),
      moodSoundEnabled: serializer.fromJson<bool>(json['moodSoundEnabled']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      premiumPlan: serializer.fromJson<String?>(json['premiumPlan']),
      premiumSince: serializer.fromJson<DateTime?>(json['premiumSince']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<String>(themeMode),
      'workoutMood': serializer.toJson<String?>(workoutMood),
      'moodSoundEnabled': serializer.toJson<bool>(moodSoundEnabled),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'premiumPlan': serializer.toJson<String?>(premiumPlan),
      'premiumSince': serializer.toJson<DateTime?>(premiumSince),
    };
  }

  AppSettingsRow copyWith({
    int? id,
    String? themeMode,
    Value<String?> workoutMood = const Value.absent(),
    bool? moodSoundEnabled,
    bool? notificationsEnabled,
    Value<String?> premiumPlan = const Value.absent(),
    Value<DateTime?> premiumSince = const Value.absent(),
  }) => AppSettingsRow(
    id: id ?? this.id,
    themeMode: themeMode ?? this.themeMode,
    workoutMood: workoutMood.present ? workoutMood.value : this.workoutMood,
    moodSoundEnabled: moodSoundEnabled ?? this.moodSoundEnabled,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    premiumPlan: premiumPlan.present ? premiumPlan.value : this.premiumPlan,
    premiumSince: premiumSince.present ? premiumSince.value : this.premiumSince,
  );
  AppSettingsRow copyWithCompanion(AppSettingsRowsCompanion data) {
    return AppSettingsRow(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      workoutMood: data.workoutMood.present
          ? data.workoutMood.value
          : this.workoutMood,
      moodSoundEnabled: data.moodSoundEnabled.present
          ? data.moodSoundEnabled.value
          : this.moodSoundEnabled,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      premiumPlan: data.premiumPlan.present
          ? data.premiumPlan.value
          : this.premiumPlan,
      premiumSince: data.premiumSince.present
          ? data.premiumSince.value
          : this.premiumSince,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsRow(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('workoutMood: $workoutMood, ')
          ..write('moodSoundEnabled: $moodSoundEnabled, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('premiumPlan: $premiumPlan, ')
          ..write('premiumSince: $premiumSince')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    themeMode,
    workoutMood,
    moodSoundEnabled,
    notificationsEnabled,
    premiumPlan,
    premiumSince,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsRow &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.workoutMood == this.workoutMood &&
          other.moodSoundEnabled == this.moodSoundEnabled &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.premiumPlan == this.premiumPlan &&
          other.premiumSince == this.premiumSince);
}

class AppSettingsRowsCompanion extends UpdateCompanion<AppSettingsRow> {
  final Value<int> id;
  final Value<String> themeMode;
  final Value<String?> workoutMood;
  final Value<bool> moodSoundEnabled;
  final Value<bool> notificationsEnabled;
  final Value<String?> premiumPlan;
  final Value<DateTime?> premiumSince;
  const AppSettingsRowsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.workoutMood = const Value.absent(),
    this.moodSoundEnabled = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.premiumPlan = const Value.absent(),
    this.premiumSince = const Value.absent(),
  });
  AppSettingsRowsCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.workoutMood = const Value.absent(),
    this.moodSoundEnabled = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.premiumPlan = const Value.absent(),
    this.premiumSince = const Value.absent(),
  });
  static Insertable<AppSettingsRow> custom({
    Expression<int>? id,
    Expression<String>? themeMode,
    Expression<String>? workoutMood,
    Expression<bool>? moodSoundEnabled,
    Expression<bool>? notificationsEnabled,
    Expression<String>? premiumPlan,
    Expression<DateTime>? premiumSince,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (workoutMood != null) 'workout_mood': workoutMood,
      if (moodSoundEnabled != null) 'mood_sound_enabled': moodSoundEnabled,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (premiumPlan != null) 'premium_plan': premiumPlan,
      if (premiumSince != null) 'premium_since': premiumSince,
    });
  }

  AppSettingsRowsCompanion copyWith({
    Value<int>? id,
    Value<String>? themeMode,
    Value<String?>? workoutMood,
    Value<bool>? moodSoundEnabled,
    Value<bool>? notificationsEnabled,
    Value<String?>? premiumPlan,
    Value<DateTime?>? premiumSince,
  }) {
    return AppSettingsRowsCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      workoutMood: workoutMood ?? this.workoutMood,
      moodSoundEnabled: moodSoundEnabled ?? this.moodSoundEnabled,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      premiumPlan: premiumPlan ?? this.premiumPlan,
      premiumSince: premiumSince ?? this.premiumSince,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (workoutMood.present) {
      map['workout_mood'] = Variable<String>(workoutMood.value);
    }
    if (moodSoundEnabled.present) {
      map['mood_sound_enabled'] = Variable<bool>(moodSoundEnabled.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (premiumPlan.present) {
      map['premium_plan'] = Variable<String>(premiumPlan.value);
    }
    if (premiumSince.present) {
      map['premium_since'] = Variable<DateTime>(premiumSince.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsRowsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('workoutMood: $workoutMood, ')
          ..write('moodSoundEnabled: $moodSoundEnabled, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('premiumPlan: $premiumPlan, ')
          ..write('premiumSince: $premiumSince')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfileRowsTable userProfileRows = $UserProfileRowsTable(
    this,
  );
  late final $UserPainAreaRowsTable userPainAreaRows = $UserPainAreaRowsTable(
    this,
  );
  late final $UserBreakTimeRowsTable userBreakTimeRows =
      $UserBreakTimeRowsTable(this);
  late final $SessionLogRowsTable sessionLogRows = $SessionLogRowsTable(this);
  late final $JourneyMetaRowsTable journeyMetaRows = $JourneyMetaRowsTable(
    this,
  );
  late final $JourneyCompletedDayRowsTable journeyCompletedDayRows =
      $JourneyCompletedDayRowsTable(this);
  late final $DailyCompletedSessionRowsTable dailyCompletedSessionRows =
      $DailyCompletedSessionRowsTable(this);
  late final $UnlockedAchievementRowsTable unlockedAchievementRows =
      $UnlockedAchievementRowsTable(this);
  late final $SeenMilestoneRowsTable seenMilestoneRows =
      $SeenMilestoneRowsTable(this);
  late final $MobilityScoreRowsTable mobilityScoreRows =
      $MobilityScoreRowsTable(this);
  late final $PostureAnalysisRowsTable postureAnalysisRows =
      $PostureAnalysisRowsTable(this);
  late final $AiDailyPlanRowsTable aiDailyPlanRows = $AiDailyPlanRowsTable(
    this,
  );
  late final $AppSettingsRowsTable appSettingsRows = $AppSettingsRowsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfileRows,
    userPainAreaRows,
    userBreakTimeRows,
    sessionLogRows,
    journeyMetaRows,
    journeyCompletedDayRows,
    dailyCompletedSessionRows,
    unlockedAchievementRows,
    seenMilestoneRows,
    mobilityScoreRows,
    postureAnalysisRows,
    aiDailyPlanRows,
    appSettingsRows,
  ];
}

typedef $$UserProfileRowsTableCreateCompanionBuilder =
    UserProfileRowsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> sittingHours,
      Value<String?> goal,
      Value<int> reminderMinutes,
      Value<bool> smartReminders,
      Value<bool> onboardingComplete,
      Value<int> streakDays,
      Value<int> mobilityPoints,
      Value<bool> isPremium,
    });
typedef $$UserProfileRowsTableUpdateCompanionBuilder =
    UserProfileRowsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> sittingHours,
      Value<String?> goal,
      Value<int> reminderMinutes,
      Value<bool> smartReminders,
      Value<bool> onboardingComplete,
      Value<int> streakDays,
      Value<int> mobilityPoints,
      Value<bool> isPremium,
    });

class $$UserProfileRowsTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sittingHours => $composableBuilder(
    column: $table.sittingHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderMinutes => $composableBuilder(
    column: $table.reminderMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get smartReminders => $composableBuilder(
    column: $table.smartReminders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mobilityPoints => $composableBuilder(
    column: $table.mobilityPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfileRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sittingHours => $composableBuilder(
    column: $table.sittingHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderMinutes => $composableBuilder(
    column: $table.reminderMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get smartReminders => $composableBuilder(
    column: $table.smartReminders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mobilityPoints => $composableBuilder(
    column: $table.mobilityPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfileRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sittingHours => $composableBuilder(
    column: $table.sittingHours,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumn<int> get reminderMinutes => $composableBuilder(
    column: $table.reminderMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get smartReminders => $composableBuilder(
    column: $table.smartReminders,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => column,
  );

  GeneratedColumn<int> get streakDays => $composableBuilder(
    column: $table.streakDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mobilityPoints => $composableBuilder(
    column: $table.mobilityPoints,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPremium =>
      $composableBuilder(column: $table.isPremium, builder: (column) => column);
}

class $$UserProfileRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfileRowsTable,
          UserProfileRow,
          $$UserProfileRowsTableFilterComposer,
          $$UserProfileRowsTableOrderingComposer,
          $$UserProfileRowsTableAnnotationComposer,
          $$UserProfileRowsTableCreateCompanionBuilder,
          $$UserProfileRowsTableUpdateCompanionBuilder,
          (
            UserProfileRow,
            BaseReferences<
              _$AppDatabase,
              $UserProfileRowsTable,
              UserProfileRow
            >,
          ),
          UserProfileRow,
          PrefetchHooks Function()
        > {
  $$UserProfileRowsTableTableManager(
    _$AppDatabase db,
    $UserProfileRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfileRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfileRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfileRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> sittingHours = const Value.absent(),
                Value<String?> goal = const Value.absent(),
                Value<int> reminderMinutes = const Value.absent(),
                Value<bool> smartReminders = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> streakDays = const Value.absent(),
                Value<int> mobilityPoints = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
              }) => UserProfileRowsCompanion(
                id: id,
                name: name,
                sittingHours: sittingHours,
                goal: goal,
                reminderMinutes: reminderMinutes,
                smartReminders: smartReminders,
                onboardingComplete: onboardingComplete,
                streakDays: streakDays,
                mobilityPoints: mobilityPoints,
                isPremium: isPremium,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> sittingHours = const Value.absent(),
                Value<String?> goal = const Value.absent(),
                Value<int> reminderMinutes = const Value.absent(),
                Value<bool> smartReminders = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> streakDays = const Value.absent(),
                Value<int> mobilityPoints = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
              }) => UserProfileRowsCompanion.insert(
                id: id,
                name: name,
                sittingHours: sittingHours,
                goal: goal,
                reminderMinutes: reminderMinutes,
                smartReminders: smartReminders,
                onboardingComplete: onboardingComplete,
                streakDays: streakDays,
                mobilityPoints: mobilityPoints,
                isPremium: isPremium,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfileRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfileRowsTable,
      UserProfileRow,
      $$UserProfileRowsTableFilterComposer,
      $$UserProfileRowsTableOrderingComposer,
      $$UserProfileRowsTableAnnotationComposer,
      $$UserProfileRowsTableCreateCompanionBuilder,
      $$UserProfileRowsTableUpdateCompanionBuilder,
      (
        UserProfileRow,
        BaseReferences<_$AppDatabase, $UserProfileRowsTable, UserProfileRow>,
      ),
      UserProfileRow,
      PrefetchHooks Function()
    >;
typedef $$UserPainAreaRowsTableCreateCompanionBuilder =
    UserPainAreaRowsCompanion Function({
      required String area,
      Value<int> rowid,
    });
typedef $$UserPainAreaRowsTableUpdateCompanionBuilder =
    UserPainAreaRowsCompanion Function({Value<String> area, Value<int> rowid});

class $$UserPainAreaRowsTableFilterComposer
    extends Composer<_$AppDatabase, $UserPainAreaRowsTable> {
  $$UserPainAreaRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserPainAreaRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserPainAreaRowsTable> {
  $$UserPainAreaRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserPainAreaRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserPainAreaRowsTable> {
  $$UserPainAreaRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);
}

class $$UserPainAreaRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserPainAreaRowsTable,
          UserPainAreaRow,
          $$UserPainAreaRowsTableFilterComposer,
          $$UserPainAreaRowsTableOrderingComposer,
          $$UserPainAreaRowsTableAnnotationComposer,
          $$UserPainAreaRowsTableCreateCompanionBuilder,
          $$UserPainAreaRowsTableUpdateCompanionBuilder,
          (
            UserPainAreaRow,
            BaseReferences<
              _$AppDatabase,
              $UserPainAreaRowsTable,
              UserPainAreaRow
            >,
          ),
          UserPainAreaRow,
          PrefetchHooks Function()
        > {
  $$UserPainAreaRowsTableTableManager(
    _$AppDatabase db,
    $UserPainAreaRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserPainAreaRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserPainAreaRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserPainAreaRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> area = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserPainAreaRowsCompanion(area: area, rowid: rowid),
          createCompanionCallback:
              ({
                required String area,
                Value<int> rowid = const Value.absent(),
              }) => UserPainAreaRowsCompanion.insert(area: area, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserPainAreaRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserPainAreaRowsTable,
      UserPainAreaRow,
      $$UserPainAreaRowsTableFilterComposer,
      $$UserPainAreaRowsTableOrderingComposer,
      $$UserPainAreaRowsTableAnnotationComposer,
      $$UserPainAreaRowsTableCreateCompanionBuilder,
      $$UserPainAreaRowsTableUpdateCompanionBuilder,
      (
        UserPainAreaRow,
        BaseReferences<_$AppDatabase, $UserPainAreaRowsTable, UserPainAreaRow>,
      ),
      UserPainAreaRow,
      PrefetchHooks Function()
    >;
typedef $$UserBreakTimeRowsTableCreateCompanionBuilder =
    UserBreakTimeRowsCompanion Function({
      required String breakTime,
      Value<int> rowid,
    });
typedef $$UserBreakTimeRowsTableUpdateCompanionBuilder =
    UserBreakTimeRowsCompanion Function({
      Value<String> breakTime,
      Value<int> rowid,
    });

class $$UserBreakTimeRowsTableFilterComposer
    extends Composer<_$AppDatabase, $UserBreakTimeRowsTable> {
  $$UserBreakTimeRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserBreakTimeRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserBreakTimeRowsTable> {
  $$UserBreakTimeRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserBreakTimeRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserBreakTimeRowsTable> {
  $$UserBreakTimeRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get breakTime =>
      $composableBuilder(column: $table.breakTime, builder: (column) => column);
}

class $$UserBreakTimeRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserBreakTimeRowsTable,
          UserBreakTimeRow,
          $$UserBreakTimeRowsTableFilterComposer,
          $$UserBreakTimeRowsTableOrderingComposer,
          $$UserBreakTimeRowsTableAnnotationComposer,
          $$UserBreakTimeRowsTableCreateCompanionBuilder,
          $$UserBreakTimeRowsTableUpdateCompanionBuilder,
          (
            UserBreakTimeRow,
            BaseReferences<
              _$AppDatabase,
              $UserBreakTimeRowsTable,
              UserBreakTimeRow
            >,
          ),
          UserBreakTimeRow,
          PrefetchHooks Function()
        > {
  $$UserBreakTimeRowsTableTableManager(
    _$AppDatabase db,
    $UserBreakTimeRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserBreakTimeRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserBreakTimeRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserBreakTimeRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> breakTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserBreakTimeRowsCompanion(
                breakTime: breakTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String breakTime,
                Value<int> rowid = const Value.absent(),
              }) => UserBreakTimeRowsCompanion.insert(
                breakTime: breakTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserBreakTimeRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserBreakTimeRowsTable,
      UserBreakTimeRow,
      $$UserBreakTimeRowsTableFilterComposer,
      $$UserBreakTimeRowsTableOrderingComposer,
      $$UserBreakTimeRowsTableAnnotationComposer,
      $$UserBreakTimeRowsTableCreateCompanionBuilder,
      $$UserBreakTimeRowsTableUpdateCompanionBuilder,
      (
        UserBreakTimeRow,
        BaseReferences<
          _$AppDatabase,
          $UserBreakTimeRowsTable,
          UserBreakTimeRow
        >,
      ),
      UserBreakTimeRow,
      PrefetchHooks Function()
    >;
typedef $$SessionLogRowsTableCreateCompanionBuilder =
    SessionLogRowsCompanion Function({
      required String id,
      required String sessionId,
      required DateTime completedAt,
      required int durationMinutes,
      required int prePainScore,
      required int postPainScore,
      required int mobilityPointsEarned,
      Value<int> rowid,
    });
typedef $$SessionLogRowsTableUpdateCompanionBuilder =
    SessionLogRowsCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<DateTime> completedAt,
      Value<int> durationMinutes,
      Value<int> prePainScore,
      Value<int> postPainScore,
      Value<int> mobilityPointsEarned,
      Value<int> rowid,
    });

class $$SessionLogRowsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionLogRowsTable> {
  $$SessionLogRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get postPainScore => $composableBuilder(
    column: $table.postPainScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mobilityPointsEarned => $composableBuilder(
    column: $table.mobilityPointsEarned,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionLogRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionLogRowsTable> {
  $$SessionLogRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get postPainScore => $composableBuilder(
    column: $table.postPainScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mobilityPointsEarned => $composableBuilder(
    column: $table.mobilityPointsEarned,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionLogRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionLogRowsTable> {
  $$SessionLogRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get postPainScore => $composableBuilder(
    column: $table.postPainScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mobilityPointsEarned => $composableBuilder(
    column: $table.mobilityPointsEarned,
    builder: (column) => column,
  );
}

class $$SessionLogRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionLogRowsTable,
          SessionLogRow,
          $$SessionLogRowsTableFilterComposer,
          $$SessionLogRowsTableOrderingComposer,
          $$SessionLogRowsTableAnnotationComposer,
          $$SessionLogRowsTableCreateCompanionBuilder,
          $$SessionLogRowsTableUpdateCompanionBuilder,
          (
            SessionLogRow,
            BaseReferences<_$AppDatabase, $SessionLogRowsTable, SessionLogRow>,
          ),
          SessionLogRow,
          PrefetchHooks Function()
        > {
  $$SessionLogRowsTableTableManager(
    _$AppDatabase db,
    $SessionLogRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionLogRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionLogRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionLogRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
                Value<int> prePainScore = const Value.absent(),
                Value<int> postPainScore = const Value.absent(),
                Value<int> mobilityPointsEarned = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionLogRowsCompanion(
                id: id,
                sessionId: sessionId,
                completedAt: completedAt,
                durationMinutes: durationMinutes,
                prePainScore: prePainScore,
                postPainScore: postPainScore,
                mobilityPointsEarned: mobilityPointsEarned,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required DateTime completedAt,
                required int durationMinutes,
                required int prePainScore,
                required int postPainScore,
                required int mobilityPointsEarned,
                Value<int> rowid = const Value.absent(),
              }) => SessionLogRowsCompanion.insert(
                id: id,
                sessionId: sessionId,
                completedAt: completedAt,
                durationMinutes: durationMinutes,
                prePainScore: prePainScore,
                postPainScore: postPainScore,
                mobilityPointsEarned: mobilityPointsEarned,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionLogRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionLogRowsTable,
      SessionLogRow,
      $$SessionLogRowsTableFilterComposer,
      $$SessionLogRowsTableOrderingComposer,
      $$SessionLogRowsTableAnnotationComposer,
      $$SessionLogRowsTableCreateCompanionBuilder,
      $$SessionLogRowsTableUpdateCompanionBuilder,
      (
        SessionLogRow,
        BaseReferences<_$AppDatabase, $SessionLogRowsTable, SessionLogRow>,
      ),
      SessionLogRow,
      PrefetchHooks Function()
    >;
typedef $$JourneyMetaRowsTableCreateCompanionBuilder =
    JourneyMetaRowsCompanion Function({
      Value<int> id,
      Value<int> currentDay,
      Value<DateTime?> lastActiveDate,
      Value<DateTime?> lastCheckInDate,
      Value<bool> checkedInToday,
      Value<int> prePainScore,
      Value<DateTime?> programStartDate,
    });
typedef $$JourneyMetaRowsTableUpdateCompanionBuilder =
    JourneyMetaRowsCompanion Function({
      Value<int> id,
      Value<int> currentDay,
      Value<DateTime?> lastActiveDate,
      Value<DateTime?> lastCheckInDate,
      Value<bool> checkedInToday,
      Value<int> prePainScore,
      Value<DateTime?> programStartDate,
    });

class $$JourneyMetaRowsTableFilterComposer
    extends Composer<_$AppDatabase, $JourneyMetaRowsTable> {
  $$JourneyMetaRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentDay => $composableBuilder(
    column: $table.currentDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCheckInDate => $composableBuilder(
    column: $table.lastCheckInDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get checkedInToday => $composableBuilder(
    column: $table.checkedInToday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get programStartDate => $composableBuilder(
    column: $table.programStartDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JourneyMetaRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $JourneyMetaRowsTable> {
  $$JourneyMetaRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentDay => $composableBuilder(
    column: $table.currentDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCheckInDate => $composableBuilder(
    column: $table.lastCheckInDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get checkedInToday => $composableBuilder(
    column: $table.checkedInToday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get programStartDate => $composableBuilder(
    column: $table.programStartDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JourneyMetaRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JourneyMetaRowsTable> {
  $$JourneyMetaRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get currentDay => $composableBuilder(
    column: $table.currentDay,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastCheckInDate => $composableBuilder(
    column: $table.lastCheckInDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get checkedInToday => $composableBuilder(
    column: $table.checkedInToday,
    builder: (column) => column,
  );

  GeneratedColumn<int> get prePainScore => $composableBuilder(
    column: $table.prePainScore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get programStartDate => $composableBuilder(
    column: $table.programStartDate,
    builder: (column) => column,
  );
}

class $$JourneyMetaRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JourneyMetaRowsTable,
          JourneyMetaRow,
          $$JourneyMetaRowsTableFilterComposer,
          $$JourneyMetaRowsTableOrderingComposer,
          $$JourneyMetaRowsTableAnnotationComposer,
          $$JourneyMetaRowsTableCreateCompanionBuilder,
          $$JourneyMetaRowsTableUpdateCompanionBuilder,
          (
            JourneyMetaRow,
            BaseReferences<
              _$AppDatabase,
              $JourneyMetaRowsTable,
              JourneyMetaRow
            >,
          ),
          JourneyMetaRow,
          PrefetchHooks Function()
        > {
  $$JourneyMetaRowsTableTableManager(
    _$AppDatabase db,
    $JourneyMetaRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JourneyMetaRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JourneyMetaRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JourneyMetaRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> currentDay = const Value.absent(),
                Value<DateTime?> lastActiveDate = const Value.absent(),
                Value<DateTime?> lastCheckInDate = const Value.absent(),
                Value<bool> checkedInToday = const Value.absent(),
                Value<int> prePainScore = const Value.absent(),
                Value<DateTime?> programStartDate = const Value.absent(),
              }) => JourneyMetaRowsCompanion(
                id: id,
                currentDay: currentDay,
                lastActiveDate: lastActiveDate,
                lastCheckInDate: lastCheckInDate,
                checkedInToday: checkedInToday,
                prePainScore: prePainScore,
                programStartDate: programStartDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> currentDay = const Value.absent(),
                Value<DateTime?> lastActiveDate = const Value.absent(),
                Value<DateTime?> lastCheckInDate = const Value.absent(),
                Value<bool> checkedInToday = const Value.absent(),
                Value<int> prePainScore = const Value.absent(),
                Value<DateTime?> programStartDate = const Value.absent(),
              }) => JourneyMetaRowsCompanion.insert(
                id: id,
                currentDay: currentDay,
                lastActiveDate: lastActiveDate,
                lastCheckInDate: lastCheckInDate,
                checkedInToday: checkedInToday,
                prePainScore: prePainScore,
                programStartDate: programStartDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JourneyMetaRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JourneyMetaRowsTable,
      JourneyMetaRow,
      $$JourneyMetaRowsTableFilterComposer,
      $$JourneyMetaRowsTableOrderingComposer,
      $$JourneyMetaRowsTableAnnotationComposer,
      $$JourneyMetaRowsTableCreateCompanionBuilder,
      $$JourneyMetaRowsTableUpdateCompanionBuilder,
      (
        JourneyMetaRow,
        BaseReferences<_$AppDatabase, $JourneyMetaRowsTable, JourneyMetaRow>,
      ),
      JourneyMetaRow,
      PrefetchHooks Function()
    >;
typedef $$JourneyCompletedDayRowsTableCreateCompanionBuilder =
    JourneyCompletedDayRowsCompanion Function({Value<int> day});
typedef $$JourneyCompletedDayRowsTableUpdateCompanionBuilder =
    JourneyCompletedDayRowsCompanion Function({Value<int> day});

class $$JourneyCompletedDayRowsTableFilterComposer
    extends Composer<_$AppDatabase, $JourneyCompletedDayRowsTable> {
  $$JourneyCompletedDayRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JourneyCompletedDayRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $JourneyCompletedDayRowsTable> {
  $$JourneyCompletedDayRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JourneyCompletedDayRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JourneyCompletedDayRowsTable> {
  $$JourneyCompletedDayRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);
}

class $$JourneyCompletedDayRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JourneyCompletedDayRowsTable,
          JourneyCompletedDayRow,
          $$JourneyCompletedDayRowsTableFilterComposer,
          $$JourneyCompletedDayRowsTableOrderingComposer,
          $$JourneyCompletedDayRowsTableAnnotationComposer,
          $$JourneyCompletedDayRowsTableCreateCompanionBuilder,
          $$JourneyCompletedDayRowsTableUpdateCompanionBuilder,
          (
            JourneyCompletedDayRow,
            BaseReferences<
              _$AppDatabase,
              $JourneyCompletedDayRowsTable,
              JourneyCompletedDayRow
            >,
          ),
          JourneyCompletedDayRow,
          PrefetchHooks Function()
        > {
  $$JourneyCompletedDayRowsTableTableManager(
    _$AppDatabase db,
    $JourneyCompletedDayRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JourneyCompletedDayRowsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$JourneyCompletedDayRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$JourneyCompletedDayRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback: ({Value<int> day = const Value.absent()}) =>
              JourneyCompletedDayRowsCompanion(day: day),
          createCompanionCallback: ({Value<int> day = const Value.absent()}) =>
              JourneyCompletedDayRowsCompanion.insert(day: day),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JourneyCompletedDayRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JourneyCompletedDayRowsTable,
      JourneyCompletedDayRow,
      $$JourneyCompletedDayRowsTableFilterComposer,
      $$JourneyCompletedDayRowsTableOrderingComposer,
      $$JourneyCompletedDayRowsTableAnnotationComposer,
      $$JourneyCompletedDayRowsTableCreateCompanionBuilder,
      $$JourneyCompletedDayRowsTableUpdateCompanionBuilder,
      (
        JourneyCompletedDayRow,
        BaseReferences<
          _$AppDatabase,
          $JourneyCompletedDayRowsTable,
          JourneyCompletedDayRow
        >,
      ),
      JourneyCompletedDayRow,
      PrefetchHooks Function()
    >;
typedef $$DailyCompletedSessionRowsTableCreateCompanionBuilder =
    DailyCompletedSessionRowsCompanion Function({
      required String sessionId,
      Value<int> rowid,
    });
typedef $$DailyCompletedSessionRowsTableUpdateCompanionBuilder =
    DailyCompletedSessionRowsCompanion Function({
      Value<String> sessionId,
      Value<int> rowid,
    });

class $$DailyCompletedSessionRowsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyCompletedSessionRowsTable> {
  $$DailyCompletedSessionRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyCompletedSessionRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyCompletedSessionRowsTable> {
  $$DailyCompletedSessionRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyCompletedSessionRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyCompletedSessionRowsTable> {
  $$DailyCompletedSessionRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);
}

class $$DailyCompletedSessionRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyCompletedSessionRowsTable,
          DailyCompletedSessionRow,
          $$DailyCompletedSessionRowsTableFilterComposer,
          $$DailyCompletedSessionRowsTableOrderingComposer,
          $$DailyCompletedSessionRowsTableAnnotationComposer,
          $$DailyCompletedSessionRowsTableCreateCompanionBuilder,
          $$DailyCompletedSessionRowsTableUpdateCompanionBuilder,
          (
            DailyCompletedSessionRow,
            BaseReferences<
              _$AppDatabase,
              $DailyCompletedSessionRowsTable,
              DailyCompletedSessionRow
            >,
          ),
          DailyCompletedSessionRow,
          PrefetchHooks Function()
        > {
  $$DailyCompletedSessionRowsTableTableManager(
    _$AppDatabase db,
    $DailyCompletedSessionRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyCompletedSessionRowsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DailyCompletedSessionRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DailyCompletedSessionRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyCompletedSessionRowsCompanion(
                sessionId: sessionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                Value<int> rowid = const Value.absent(),
              }) => DailyCompletedSessionRowsCompanion.insert(
                sessionId: sessionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyCompletedSessionRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyCompletedSessionRowsTable,
      DailyCompletedSessionRow,
      $$DailyCompletedSessionRowsTableFilterComposer,
      $$DailyCompletedSessionRowsTableOrderingComposer,
      $$DailyCompletedSessionRowsTableAnnotationComposer,
      $$DailyCompletedSessionRowsTableCreateCompanionBuilder,
      $$DailyCompletedSessionRowsTableUpdateCompanionBuilder,
      (
        DailyCompletedSessionRow,
        BaseReferences<
          _$AppDatabase,
          $DailyCompletedSessionRowsTable,
          DailyCompletedSessionRow
        >,
      ),
      DailyCompletedSessionRow,
      PrefetchHooks Function()
    >;
typedef $$UnlockedAchievementRowsTableCreateCompanionBuilder =
    UnlockedAchievementRowsCompanion Function({
      required String achievementId,
      Value<int> rowid,
    });
typedef $$UnlockedAchievementRowsTableUpdateCompanionBuilder =
    UnlockedAchievementRowsCompanion Function({
      Value<String> achievementId,
      Value<int> rowid,
    });

class $$UnlockedAchievementRowsTableFilterComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementRowsTable> {
  $$UnlockedAchievementRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnlockedAchievementRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementRowsTable> {
  $$UnlockedAchievementRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnlockedAchievementRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnlockedAchievementRowsTable> {
  $$UnlockedAchievementRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get achievementId => $composableBuilder(
    column: $table.achievementId,
    builder: (column) => column,
  );
}

class $$UnlockedAchievementRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnlockedAchievementRowsTable,
          UnlockedAchievementRow,
          $$UnlockedAchievementRowsTableFilterComposer,
          $$UnlockedAchievementRowsTableOrderingComposer,
          $$UnlockedAchievementRowsTableAnnotationComposer,
          $$UnlockedAchievementRowsTableCreateCompanionBuilder,
          $$UnlockedAchievementRowsTableUpdateCompanionBuilder,
          (
            UnlockedAchievementRow,
            BaseReferences<
              _$AppDatabase,
              $UnlockedAchievementRowsTable,
              UnlockedAchievementRow
            >,
          ),
          UnlockedAchievementRow,
          PrefetchHooks Function()
        > {
  $$UnlockedAchievementRowsTableTableManager(
    _$AppDatabase db,
    $UnlockedAchievementRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnlockedAchievementRowsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UnlockedAchievementRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UnlockedAchievementRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> achievementId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnlockedAchievementRowsCompanion(
                achievementId: achievementId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String achievementId,
                Value<int> rowid = const Value.absent(),
              }) => UnlockedAchievementRowsCompanion.insert(
                achievementId: achievementId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnlockedAchievementRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnlockedAchievementRowsTable,
      UnlockedAchievementRow,
      $$UnlockedAchievementRowsTableFilterComposer,
      $$UnlockedAchievementRowsTableOrderingComposer,
      $$UnlockedAchievementRowsTableAnnotationComposer,
      $$UnlockedAchievementRowsTableCreateCompanionBuilder,
      $$UnlockedAchievementRowsTableUpdateCompanionBuilder,
      (
        UnlockedAchievementRow,
        BaseReferences<
          _$AppDatabase,
          $UnlockedAchievementRowsTable,
          UnlockedAchievementRow
        >,
      ),
      UnlockedAchievementRow,
      PrefetchHooks Function()
    >;
typedef $$SeenMilestoneRowsTableCreateCompanionBuilder =
    SeenMilestoneRowsCompanion Function({Value<int> day});
typedef $$SeenMilestoneRowsTableUpdateCompanionBuilder =
    SeenMilestoneRowsCompanion Function({Value<int> day});

class $$SeenMilestoneRowsTableFilterComposer
    extends Composer<_$AppDatabase, $SeenMilestoneRowsTable> {
  $$SeenMilestoneRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SeenMilestoneRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $SeenMilestoneRowsTable> {
  $$SeenMilestoneRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SeenMilestoneRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SeenMilestoneRowsTable> {
  $$SeenMilestoneRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);
}

class $$SeenMilestoneRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SeenMilestoneRowsTable,
          SeenMilestoneRow,
          $$SeenMilestoneRowsTableFilterComposer,
          $$SeenMilestoneRowsTableOrderingComposer,
          $$SeenMilestoneRowsTableAnnotationComposer,
          $$SeenMilestoneRowsTableCreateCompanionBuilder,
          $$SeenMilestoneRowsTableUpdateCompanionBuilder,
          (
            SeenMilestoneRow,
            BaseReferences<
              _$AppDatabase,
              $SeenMilestoneRowsTable,
              SeenMilestoneRow
            >,
          ),
          SeenMilestoneRow,
          PrefetchHooks Function()
        > {
  $$SeenMilestoneRowsTableTableManager(
    _$AppDatabase db,
    $SeenMilestoneRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SeenMilestoneRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SeenMilestoneRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SeenMilestoneRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback: ({Value<int> day = const Value.absent()}) =>
              SeenMilestoneRowsCompanion(day: day),
          createCompanionCallback: ({Value<int> day = const Value.absent()}) =>
              SeenMilestoneRowsCompanion.insert(day: day),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SeenMilestoneRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SeenMilestoneRowsTable,
      SeenMilestoneRow,
      $$SeenMilestoneRowsTableFilterComposer,
      $$SeenMilestoneRowsTableOrderingComposer,
      $$SeenMilestoneRowsTableAnnotationComposer,
      $$SeenMilestoneRowsTableCreateCompanionBuilder,
      $$SeenMilestoneRowsTableUpdateCompanionBuilder,
      (
        SeenMilestoneRow,
        BaseReferences<
          _$AppDatabase,
          $SeenMilestoneRowsTable,
          SeenMilestoneRow
        >,
      ),
      SeenMilestoneRow,
      PrefetchHooks Function()
    >;
typedef $$MobilityScoreRowsTableCreateCompanionBuilder =
    MobilityScoreRowsCompanion Function({
      Value<int> id,
      required int overall,
      required String areaScoresJson,
    });
typedef $$MobilityScoreRowsTableUpdateCompanionBuilder =
    MobilityScoreRowsCompanion Function({
      Value<int> id,
      Value<int> overall,
      Value<String> areaScoresJson,
    });

class $$MobilityScoreRowsTableFilterComposer
    extends Composer<_$AppDatabase, $MobilityScoreRowsTable> {
  $$MobilityScoreRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get overall => $composableBuilder(
    column: $table.overall,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaScoresJson => $composableBuilder(
    column: $table.areaScoresJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MobilityScoreRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $MobilityScoreRowsTable> {
  $$MobilityScoreRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get overall => $composableBuilder(
    column: $table.overall,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaScoresJson => $composableBuilder(
    column: $table.areaScoresJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MobilityScoreRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MobilityScoreRowsTable> {
  $$MobilityScoreRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get overall =>
      $composableBuilder(column: $table.overall, builder: (column) => column);

  GeneratedColumn<String> get areaScoresJson => $composableBuilder(
    column: $table.areaScoresJson,
    builder: (column) => column,
  );
}

class $$MobilityScoreRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MobilityScoreRowsTable,
          MobilityScoreRow,
          $$MobilityScoreRowsTableFilterComposer,
          $$MobilityScoreRowsTableOrderingComposer,
          $$MobilityScoreRowsTableAnnotationComposer,
          $$MobilityScoreRowsTableCreateCompanionBuilder,
          $$MobilityScoreRowsTableUpdateCompanionBuilder,
          (
            MobilityScoreRow,
            BaseReferences<
              _$AppDatabase,
              $MobilityScoreRowsTable,
              MobilityScoreRow
            >,
          ),
          MobilityScoreRow,
          PrefetchHooks Function()
        > {
  $$MobilityScoreRowsTableTableManager(
    _$AppDatabase db,
    $MobilityScoreRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MobilityScoreRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MobilityScoreRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MobilityScoreRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> overall = const Value.absent(),
                Value<String> areaScoresJson = const Value.absent(),
              }) => MobilityScoreRowsCompanion(
                id: id,
                overall: overall,
                areaScoresJson: areaScoresJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int overall,
                required String areaScoresJson,
              }) => MobilityScoreRowsCompanion.insert(
                id: id,
                overall: overall,
                areaScoresJson: areaScoresJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MobilityScoreRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MobilityScoreRowsTable,
      MobilityScoreRow,
      $$MobilityScoreRowsTableFilterComposer,
      $$MobilityScoreRowsTableOrderingComposer,
      $$MobilityScoreRowsTableAnnotationComposer,
      $$MobilityScoreRowsTableCreateCompanionBuilder,
      $$MobilityScoreRowsTableUpdateCompanionBuilder,
      (
        MobilityScoreRow,
        BaseReferences<
          _$AppDatabase,
          $MobilityScoreRowsTable,
          MobilityScoreRow
        >,
      ),
      MobilityScoreRow,
      PrefetchHooks Function()
    >;
typedef $$PostureAnalysisRowsTableCreateCompanionBuilder =
    PostureAnalysisRowsCompanion Function({
      required String id,
      required DateTime createdAt,
      required String issuesJson,
      required int score,
      required String summary,
      required String recommendationsJson,
      required String deskTipsJson,
      Value<int> rowid,
    });
typedef $$PostureAnalysisRowsTableUpdateCompanionBuilder =
    PostureAnalysisRowsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<String> issuesJson,
      Value<int> score,
      Value<String> summary,
      Value<String> recommendationsJson,
      Value<String> deskTipsJson,
      Value<int> rowid,
    });

class $$PostureAnalysisRowsTableFilterComposer
    extends Composer<_$AppDatabase, $PostureAnalysisRowsTable> {
  $$PostureAnalysisRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get issuesJson => $composableBuilder(
    column: $table.issuesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recommendationsJson => $composableBuilder(
    column: $table.recommendationsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskTipsJson => $composableBuilder(
    column: $table.deskTipsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PostureAnalysisRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $PostureAnalysisRowsTable> {
  $$PostureAnalysisRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get issuesJson => $composableBuilder(
    column: $table.issuesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recommendationsJson => $composableBuilder(
    column: $table.recommendationsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskTipsJson => $composableBuilder(
    column: $table.deskTipsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PostureAnalysisRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostureAnalysisRowsTable> {
  $$PostureAnalysisRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get issuesJson => $composableBuilder(
    column: $table.issuesJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get recommendationsJson => $composableBuilder(
    column: $table.recommendationsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deskTipsJson => $composableBuilder(
    column: $table.deskTipsJson,
    builder: (column) => column,
  );
}

class $$PostureAnalysisRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PostureAnalysisRowsTable,
          PostureAnalysisRow,
          $$PostureAnalysisRowsTableFilterComposer,
          $$PostureAnalysisRowsTableOrderingComposer,
          $$PostureAnalysisRowsTableAnnotationComposer,
          $$PostureAnalysisRowsTableCreateCompanionBuilder,
          $$PostureAnalysisRowsTableUpdateCompanionBuilder,
          (
            PostureAnalysisRow,
            BaseReferences<
              _$AppDatabase,
              $PostureAnalysisRowsTable,
              PostureAnalysisRow
            >,
          ),
          PostureAnalysisRow,
          PrefetchHooks Function()
        > {
  $$PostureAnalysisRowsTableTableManager(
    _$AppDatabase db,
    $PostureAnalysisRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostureAnalysisRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostureAnalysisRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PostureAnalysisRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> issuesJson = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String> recommendationsJson = const Value.absent(),
                Value<String> deskTipsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PostureAnalysisRowsCompanion(
                id: id,
                createdAt: createdAt,
                issuesJson: issuesJson,
                score: score,
                summary: summary,
                recommendationsJson: recommendationsJson,
                deskTipsJson: deskTipsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime createdAt,
                required String issuesJson,
                required int score,
                required String summary,
                required String recommendationsJson,
                required String deskTipsJson,
                Value<int> rowid = const Value.absent(),
              }) => PostureAnalysisRowsCompanion.insert(
                id: id,
                createdAt: createdAt,
                issuesJson: issuesJson,
                score: score,
                summary: summary,
                recommendationsJson: recommendationsJson,
                deskTipsJson: deskTipsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PostureAnalysisRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PostureAnalysisRowsTable,
      PostureAnalysisRow,
      $$PostureAnalysisRowsTableFilterComposer,
      $$PostureAnalysisRowsTableOrderingComposer,
      $$PostureAnalysisRowsTableAnnotationComposer,
      $$PostureAnalysisRowsTableCreateCompanionBuilder,
      $$PostureAnalysisRowsTableUpdateCompanionBuilder,
      (
        PostureAnalysisRow,
        BaseReferences<
          _$AppDatabase,
          $PostureAnalysisRowsTable,
          PostureAnalysisRow
        >,
      ),
      PostureAnalysisRow,
      PrefetchHooks Function()
    >;
typedef $$AiDailyPlanRowsTableCreateCompanionBuilder =
    AiDailyPlanRowsCompanion Function({
      Value<int> id,
      required DateTime generatedAt,
      required String focus,
      required String morning,
      required String midday,
      required String evening,
      required String coachNote,
    });
typedef $$AiDailyPlanRowsTableUpdateCompanionBuilder =
    AiDailyPlanRowsCompanion Function({
      Value<int> id,
      Value<DateTime> generatedAt,
      Value<String> focus,
      Value<String> morning,
      Value<String> midday,
      Value<String> evening,
      Value<String> coachNote,
    });

class $$AiDailyPlanRowsTableFilterComposer
    extends Composer<_$AppDatabase, $AiDailyPlanRowsTable> {
  $$AiDailyPlanRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get morning => $composableBuilder(
    column: $table.morning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get midday => $composableBuilder(
    column: $table.midday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get evening => $composableBuilder(
    column: $table.evening,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coachNote => $composableBuilder(
    column: $table.coachNote,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AiDailyPlanRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $AiDailyPlanRowsTable> {
  $$AiDailyPlanRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focus => $composableBuilder(
    column: $table.focus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get morning => $composableBuilder(
    column: $table.morning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get midday => $composableBuilder(
    column: $table.midday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get evening => $composableBuilder(
    column: $table.evening,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coachNote => $composableBuilder(
    column: $table.coachNote,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AiDailyPlanRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AiDailyPlanRowsTable> {
  $$AiDailyPlanRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get focus =>
      $composableBuilder(column: $table.focus, builder: (column) => column);

  GeneratedColumn<String> get morning =>
      $composableBuilder(column: $table.morning, builder: (column) => column);

  GeneratedColumn<String> get midday =>
      $composableBuilder(column: $table.midday, builder: (column) => column);

  GeneratedColumn<String> get evening =>
      $composableBuilder(column: $table.evening, builder: (column) => column);

  GeneratedColumn<String> get coachNote =>
      $composableBuilder(column: $table.coachNote, builder: (column) => column);
}

class $$AiDailyPlanRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AiDailyPlanRowsTable,
          AiDailyPlanRow,
          $$AiDailyPlanRowsTableFilterComposer,
          $$AiDailyPlanRowsTableOrderingComposer,
          $$AiDailyPlanRowsTableAnnotationComposer,
          $$AiDailyPlanRowsTableCreateCompanionBuilder,
          $$AiDailyPlanRowsTableUpdateCompanionBuilder,
          (
            AiDailyPlanRow,
            BaseReferences<
              _$AppDatabase,
              $AiDailyPlanRowsTable,
              AiDailyPlanRow
            >,
          ),
          AiDailyPlanRow,
          PrefetchHooks Function()
        > {
  $$AiDailyPlanRowsTableTableManager(
    _$AppDatabase db,
    $AiDailyPlanRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiDailyPlanRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiDailyPlanRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiDailyPlanRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<String> focus = const Value.absent(),
                Value<String> morning = const Value.absent(),
                Value<String> midday = const Value.absent(),
                Value<String> evening = const Value.absent(),
                Value<String> coachNote = const Value.absent(),
              }) => AiDailyPlanRowsCompanion(
                id: id,
                generatedAt: generatedAt,
                focus: focus,
                morning: morning,
                midday: midday,
                evening: evening,
                coachNote: coachNote,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime generatedAt,
                required String focus,
                required String morning,
                required String midday,
                required String evening,
                required String coachNote,
              }) => AiDailyPlanRowsCompanion.insert(
                id: id,
                generatedAt: generatedAt,
                focus: focus,
                morning: morning,
                midday: midday,
                evening: evening,
                coachNote: coachNote,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AiDailyPlanRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AiDailyPlanRowsTable,
      AiDailyPlanRow,
      $$AiDailyPlanRowsTableFilterComposer,
      $$AiDailyPlanRowsTableOrderingComposer,
      $$AiDailyPlanRowsTableAnnotationComposer,
      $$AiDailyPlanRowsTableCreateCompanionBuilder,
      $$AiDailyPlanRowsTableUpdateCompanionBuilder,
      (
        AiDailyPlanRow,
        BaseReferences<_$AppDatabase, $AiDailyPlanRowsTable, AiDailyPlanRow>,
      ),
      AiDailyPlanRow,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsRowsTableCreateCompanionBuilder =
    AppSettingsRowsCompanion Function({
      Value<int> id,
      Value<String> themeMode,
      Value<String?> workoutMood,
      Value<bool> moodSoundEnabled,
      Value<bool> notificationsEnabled,
      Value<String?> premiumPlan,
      Value<DateTime?> premiumSince,
    });
typedef $$AppSettingsRowsTableUpdateCompanionBuilder =
    AppSettingsRowsCompanion Function({
      Value<int> id,
      Value<String> themeMode,
      Value<String?> workoutMood,
      Value<bool> moodSoundEnabled,
      Value<bool> notificationsEnabled,
      Value<String?> premiumPlan,
      Value<DateTime?> premiumSince,
    });

class $$AppSettingsRowsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsRowsTable> {
  $$AppSettingsRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workoutMood => $composableBuilder(
    column: $table.workoutMood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get moodSoundEnabled => $composableBuilder(
    column: $table.moodSoundEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get premiumPlan => $composableBuilder(
    column: $table.premiumPlan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get premiumSince => $composableBuilder(
    column: $table.premiumSince,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsRowsTable> {
  $$AppSettingsRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workoutMood => $composableBuilder(
    column: $table.workoutMood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get moodSoundEnabled => $composableBuilder(
    column: $table.moodSoundEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get premiumPlan => $composableBuilder(
    column: $table.premiumPlan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get premiumSince => $composableBuilder(
    column: $table.premiumSince,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsRowsTable> {
  $$AppSettingsRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get workoutMood => $composableBuilder(
    column: $table.workoutMood,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get moodSoundEnabled => $composableBuilder(
    column: $table.moodSoundEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get premiumPlan => $composableBuilder(
    column: $table.premiumPlan,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get premiumSince => $composableBuilder(
    column: $table.premiumSince,
    builder: (column) => column,
  );
}

class $$AppSettingsRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsRowsTable,
          AppSettingsRow,
          $$AppSettingsRowsTableFilterComposer,
          $$AppSettingsRowsTableOrderingComposer,
          $$AppSettingsRowsTableAnnotationComposer,
          $$AppSettingsRowsTableCreateCompanionBuilder,
          $$AppSettingsRowsTableUpdateCompanionBuilder,
          (
            AppSettingsRow,
            BaseReferences<
              _$AppDatabase,
              $AppSettingsRowsTable,
              AppSettingsRow
            >,
          ),
          AppSettingsRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsRowsTableTableManager(
    _$AppDatabase db,
    $AppSettingsRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String?> workoutMood = const Value.absent(),
                Value<bool> moodSoundEnabled = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<String?> premiumPlan = const Value.absent(),
                Value<DateTime?> premiumSince = const Value.absent(),
              }) => AppSettingsRowsCompanion(
                id: id,
                themeMode: themeMode,
                workoutMood: workoutMood,
                moodSoundEnabled: moodSoundEnabled,
                notificationsEnabled: notificationsEnabled,
                premiumPlan: premiumPlan,
                premiumSince: premiumSince,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String?> workoutMood = const Value.absent(),
                Value<bool> moodSoundEnabled = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<String?> premiumPlan = const Value.absent(),
                Value<DateTime?> premiumSince = const Value.absent(),
              }) => AppSettingsRowsCompanion.insert(
                id: id,
                themeMode: themeMode,
                workoutMood: workoutMood,
                moodSoundEnabled: moodSoundEnabled,
                notificationsEnabled: notificationsEnabled,
                premiumPlan: premiumPlan,
                premiumSince: premiumSince,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsRowsTable,
      AppSettingsRow,
      $$AppSettingsRowsTableFilterComposer,
      $$AppSettingsRowsTableOrderingComposer,
      $$AppSettingsRowsTableAnnotationComposer,
      $$AppSettingsRowsTableCreateCompanionBuilder,
      $$AppSettingsRowsTableUpdateCompanionBuilder,
      (
        AppSettingsRow,
        BaseReferences<_$AppDatabase, $AppSettingsRowsTable, AppSettingsRow>,
      ),
      AppSettingsRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfileRowsTableTableManager get userProfileRows =>
      $$UserProfileRowsTableTableManager(_db, _db.userProfileRows);
  $$UserPainAreaRowsTableTableManager get userPainAreaRows =>
      $$UserPainAreaRowsTableTableManager(_db, _db.userPainAreaRows);
  $$UserBreakTimeRowsTableTableManager get userBreakTimeRows =>
      $$UserBreakTimeRowsTableTableManager(_db, _db.userBreakTimeRows);
  $$SessionLogRowsTableTableManager get sessionLogRows =>
      $$SessionLogRowsTableTableManager(_db, _db.sessionLogRows);
  $$JourneyMetaRowsTableTableManager get journeyMetaRows =>
      $$JourneyMetaRowsTableTableManager(_db, _db.journeyMetaRows);
  $$JourneyCompletedDayRowsTableTableManager get journeyCompletedDayRows =>
      $$JourneyCompletedDayRowsTableTableManager(
        _db,
        _db.journeyCompletedDayRows,
      );
  $$DailyCompletedSessionRowsTableTableManager get dailyCompletedSessionRows =>
      $$DailyCompletedSessionRowsTableTableManager(
        _db,
        _db.dailyCompletedSessionRows,
      );
  $$UnlockedAchievementRowsTableTableManager get unlockedAchievementRows =>
      $$UnlockedAchievementRowsTableTableManager(
        _db,
        _db.unlockedAchievementRows,
      );
  $$SeenMilestoneRowsTableTableManager get seenMilestoneRows =>
      $$SeenMilestoneRowsTableTableManager(_db, _db.seenMilestoneRows);
  $$MobilityScoreRowsTableTableManager get mobilityScoreRows =>
      $$MobilityScoreRowsTableTableManager(_db, _db.mobilityScoreRows);
  $$PostureAnalysisRowsTableTableManager get postureAnalysisRows =>
      $$PostureAnalysisRowsTableTableManager(_db, _db.postureAnalysisRows);
  $$AiDailyPlanRowsTableTableManager get aiDailyPlanRows =>
      $$AiDailyPlanRowsTableTableManager(_db, _db.aiDailyPlanRows);
  $$AppSettingsRowsTableTableManager get appSettingsRows =>
      $$AppSettingsRowsTableTableManager(_db, _db.appSettingsRows);
}
