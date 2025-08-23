class Transaction {
  final String id;
  final String userId;
  final TransactionType type;
  final TransactionStatus status;
  final double amount;
  final String currency;
  final String? description;
  final String? reference;
  final String? recipientId;
  final String? senderId;
  final DateTime createdAt;
  final DateTime? completedAt;
  final TransactionCategory category;
  final String? notes;
  final Map<String, dynamic>? metadata;

  const Transaction({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.amount,
    required this.currency,
    this.description,
    this.reference,
    this.recipientId,
    this.senderId,
    required this.createdAt,
    this.completedAt,
    required this.category,
    this.notes,
    this.metadata,
  });

  // Getter for formatted amount
  String get formattedAmount => '$currency\$${amount.toStringAsFixed(2)}';
  
  // Getter for is completed
  bool get isCompleted => status == TransactionStatus.completed;
  
  // Getter for is pending
  bool get isPending => status == TransactionStatus.pending;
  
  // Getter for is failed
  bool get isFailed => status == TransactionStatus.failed;
  
  // Getter for is outgoing (user is sender)
  bool get isOutgoing => type == TransactionType.send || type == TransactionType.payment;
  
  // Getter for is incoming (user is recipient)
  bool get isIncoming => type == TransactionType.receive || type == TransactionType.refund;

  // Copy with method for immutability
  Transaction copyWith({
    String? id,
    String? userId,
    TransactionType? type,
    TransactionStatus? status,
    double? amount,
    String? currency,
    String? description,
    String? reference,
    String? recipientId,
    String? senderId,
    DateTime? createdAt,
    DateTime? completedAt,
    TransactionCategory? category,
    String? notes,
    Map<String, dynamic>? metadata,
  }) {
    return Transaction(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      recipientId: recipientId ?? this.recipientId,
      senderId: senderId ?? this.senderId,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      category: category ?? this.category,
      notes: notes ?? this.notes,
      metadata: metadata ?? this.metadata,
    );
  }

  // Equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Transaction &&
        other.id == id &&
        other.userId == userId &&
        other.type == type &&
        other.status == status &&
        other.amount == amount;
  }

  // Hash code
  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        type.hashCode ^
        status.hashCode ^
        amount.hashCode;
  }

  // To string method
  @override
  String toString() {
    return 'Transaction(id: $id, type: $type, amount: $formattedAmount, status: $status)';
  }
}

// Transaction type enum
enum TransactionType {
  send('Send Money'),
  receive('Receive Money'),
  payment('Payment'),
  refund('Refund'),
  transfer('Transfer'),
  deposit('Deposit'),
  withdrawal('Withdrawal'),
  fee('Fee'),
  bonus('Bonus'),
  interest('Interest');

  const TransactionType(this.displayName);
  final String displayName;
}

// Transaction status enum
enum TransactionStatus {
  pending('Pending'),
  processing('Processing'),
  completed('Completed'),
  failed('Failed'),
  cancelled('Cancelled'),
  declined('Declined'),
  expired('Expired');

  const TransactionStatus(this.displayName);
  final String displayName;
}

// Transaction category enum
enum TransactionCategory {
  food('Food & Dining'),
  transportation('Transportation'),
  shopping('Shopping'),
  entertainment('Entertainment'),
  healthcare('Healthcare'),
  education('Education'),
  utilities('Utilities'),
  rent('Rent'),
  salary('Salary'),
  investment('Investment'),
  gift('Gift'),
  other('Other');

  const TransactionCategory(this.displayName);
  final String displayName;
}
