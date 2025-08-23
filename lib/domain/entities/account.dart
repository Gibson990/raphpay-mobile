class Account {
  final String id;
  final String userId;
  final String accountNumber;
  final String accountName;
  final AccountType type;
  final AccountStatus status;
  final double balance;
  final double availableBalance;
  final String currency;
  final DateTime createdAt;
  final DateTime? lastTransactionAt;
  final List<String> linkedCards;
  final AccountLimits limits;
  final Map<String, dynamic>? metadata;

  const Account({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.accountName,
    required this.type,
    required this.status,
    required this.balance,
    required this.availableBalance,
    required this.currency,
    required this.createdAt,
    this.lastTransactionAt,
    required this.linkedCards,
    required this.limits,
    this.metadata,
  });

  // Getter for formatted balance
  String get formattedBalance => '$currency\$${balance.toStringAsFixed(2)}';
  
  // Getter for formatted available balance
  String get formattedAvailableBalance => '$currency\$${availableBalance.toStringAsFixed(2)}';
  
  // Getter for is active
  bool get isActive => status == AccountStatus.active;
  
  // Getter for is suspended
  bool get isSuspended => status == AccountStatus.suspended;
  
  // Getter for is frozen
  bool get isFrozen => status == AccountStatus.frozen;
  
  // Getter for has sufficient funds
  bool get hasSufficientFunds => availableBalance > 0;
  
  // Getter for account type display name
  String get typeDisplayName => type.displayName;
  
  // Getter for status display name
  String get statusDisplayName => status.displayName;

  // Copy with method for immutability
  Account copyWith({
    String? id,
    String? userId,
    String? accountNumber,
    String? accountName,
    AccountType? type,
    AccountStatus? status,
    double? balance,
    double? availableBalance,
    String? currency,
    DateTime? createdAt,
    DateTime? lastTransactionAt,
    List<String>? linkedCards,
    AccountLimits? limits,
    Map<String, dynamic>? metadata,
  }) {
    return Account(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      type: type ?? this.type,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      availableBalance: availableBalance ?? this.availableBalance,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      lastTransactionAt: lastTransactionAt ?? this.lastTransactionAt,
      linkedCards: linkedCards ?? this.linkedCards,
      limits: limits ?? this.limits,
      metadata: metadata ?? this.metadata,
    );
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Account &&
        other.id == id &&
        other.userId == userId &&
        other.accountNumber == accountNumber &&
        other.type == type;
  }

  // Hash code
  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        accountNumber.hashCode ^
        type.hashCode;
  }

  // To string method
  @override
  String toString() {
    return 'Account(id: $id, accountNumber: $accountNumber, balance: $formattedBalance, type: $type)';
  }
}

// Account type enum
enum AccountType {
  checking('Checking Account'),
  savings('Savings Account'),
  business('Business Account'),
  investment('Investment Account'),
  credit('Credit Account'),
  wallet('Digital Wallet');

  const AccountType(this.displayName);
  final String displayName;
}

// Account status enum
enum AccountStatus {
  active('Active'),
  inactive('Inactive'),
  suspended('Suspended'),
  frozen('Frozen'),
  closed('Closed'),
  pending('Pending');

  const AccountStatus(this.displayName);
  final String displayName;
}

// Account limits
class AccountLimits {
  final double dailyTransactionLimit;
  final double monthlyTransactionLimit;
  final double singleTransactionLimit;
  final int dailyTransactionCount;
  final int monthlyTransactionCount;

  const AccountLimits({
    this.dailyTransactionLimit = 10000.0,
    this.monthlyTransactionLimit = 100000.0,
    this.singleTransactionLimit = 5000.0,
    this.dailyTransactionCount = 50,
    this.monthlyTransactionCount = 500,
  });

  // Getter for formatted daily limit
  String get formattedDailyLimit => '\$${dailyTransactionLimit.toStringAsFixed(2)}';
  
  // Getter for formatted monthly limit
  String get formattedMonthlyLimit => '\$${monthlyTransactionLimit.toStringAsFixed(2)}';
  
  // Getter for formatted single transaction limit
  String get formattedSingleTransactionLimit => '\$${singleTransactionLimit.toStringAsFixed(2)}';

  AccountLimits copyWith({
    double? dailyTransactionLimit,
    double? monthlyTransactionLimit,
    double? singleTransactionLimit,
    int? dailyTransactionCount,
    int? monthlyTransactionCount,
  }) {
    return AccountLimits(
      dailyTransactionLimit: dailyTransactionLimit ?? this.dailyTransactionLimit,
      monthlyTransactionLimit: monthlyTransactionLimit ?? this.monthlyTransactionLimit,
      singleTransactionLimit: singleTransactionLimit ?? this.singleTransactionLimit,
      dailyTransactionCount: dailyTransactionCount ?? this.dailyTransactionCount,
      monthlyTransactionCount: monthlyTransactionCount ?? this.monthlyTransactionCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccountLimits &&
        other.dailyTransactionLimit == dailyTransactionLimit &&
        other.monthlyTransactionLimit == monthlyTransactionLimit &&
        other.singleTransactionLimit == singleTransactionLimit;
  }

  @override
  int get hashCode {
    return dailyTransactionLimit.hashCode ^
        monthlyTransactionLimit.hashCode ^
        singleTransactionLimit.hashCode;
  }
}
