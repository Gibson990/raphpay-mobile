import 'package:flutter/material.dart';
import 'package:raphpay/domain/entities/user.dart';
import 'package:raphpay/domain/entities/account.dart';
import 'package:raphpay/domain/entities/transaction.dart';
import 'package:raphpay/core/constants/app_constants.dart';

class AppProvider extends ChangeNotifier {
  // App state
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String _currentTheme = 'light';
  String _currentLanguage = 'en';
  String? _authToken;
  
  // User data
  User? _currentUser;
  List<Account> _userAccounts = [];
  List<Transaction> _userTransactions = [];
  
  // Error handling
  String? _errorMessage;
  bool _hasError = false;

  // Getters
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String get currentTheme => _currentTheme;
  String get currentLanguage => _currentLanguage;
  String? get authToken => _authToken;
  User? get currentUser => _currentUser;
  List<Account> get userAccounts => _userAccounts;
  List<Transaction> get userTransactions => _userTransactions;
  String? get errorMessage => _errorMessage;
  bool get hasError => _hasError;

  // Initialize app
  Future<void> initializeApp() async {
    _setLoading(true);
    try {
      // Load saved preferences
      await _loadPreferences();
      
      // Check authentication status
      await _checkAuthenticationStatus();
      
      // Load user data if authenticated
      if (_isAuthenticated) {
        await _loadUserData();
      }
      
      _setLoading(false);
    } catch (e) {
      _setError('Failed to initialize app: $e');
      _setLoading(false);
    }
  }

  // Authentication methods
  Future<void> login(String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      // TODO: Implement actual login logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock user data for now
      _currentUser = _createMockUser();
      _authToken = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
      _isAuthenticated = true;
      
      // Load user data
      await _loadUserData();
      
      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setError('Login failed: $e');
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    
    try {
      // TODO: Implement actual logout logic
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Clear user data
      _currentUser = null;
      _authToken = null;
      _isAuthenticated = false;
      _userAccounts.clear();
      _userTransactions.clear();
      
      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setError('Logout failed: $e');
      _setLoading(false);
    }
  }

  // Theme management
  void toggleTheme() {
    _currentTheme = _currentTheme == 'light' ? 'dark' : 'light';
    _savePreferences();
    notifyListeners();
  }

  void setTheme(String theme) {
    if (_currentTheme != theme) {
      _currentTheme = theme;
      _savePreferences();
      notifyListeners();
    }
  }

  // Language management
  void setLanguage(String language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      _savePreferences();
      notifyListeners();
    }
  }

  // User data management
  Future<void> _loadUserData() async {
    try {
      // TODO: Implement actual API calls
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Mock data for now
      _userAccounts = _createMockAccounts();
      _userTransactions = _createMockTransactions();
      
      notifyListeners();
    } catch (e) {
      _setError('Failed to load user data: $e');
    }
  }

  // Error handling
  void _setError(String message) {
    _errorMessage = message;
    _hasError = true;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    _hasError = false;
    notifyListeners();
  }

  void clearError() {
    _clearError();
  }

  // Loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Preferences management
  Future<void> _loadPreferences() async {
    // TODO: Implement SharedPreferences loading
    _currentTheme = 'light';
    _currentLanguage = 'en';
  }

  Future<void> _savePreferences() async {
    // TODO: Implement SharedPreferences saving
  }

  Future<void> _checkAuthenticationStatus() async {
    // TODO: Implement token validation
    _isAuthenticated = false;
    _authToken = null;
  }

  // Mock data creation (for development)
  User _createMockUser() {
    return User(
      id: 'mock_user_001',
      email: 'user@raphpay.com',
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: '+1234567890',
                createdAt: DateTime(2024, 1, 1),
          updatedAt: DateTime(2024, 1, 1),
      isEmailVerified: true,
      isPhoneVerified: true,
      status: UserStatus.active,
      role: UserRole.user,
                preferences: UserPreferences(
            language: 'en',
            currency: 'USD',
            enableBiometric: false,
            enablePushNotifications: true,
            enableEmailNotifications: true,
            enableSmsNotifications: false,
            theme: 'light',
            enableAnalytics: true,
          ),
    );
  }

  List<Account> _createMockAccounts() {
    return [
              Account(
        id: 'mock_account_001',
        userId: 'mock_user_001',
        accountNumber: '1234567890',
        accountName: 'Main Account',
        type: AccountType.checking,
        status: AccountStatus.active,
        balance: 5000.00,
        availableBalance: 5000.00,
        currency: 'USD',
        createdAt: DateTime(2024, 1, 1),
        linkedCards: [],
        limits: AccountLimits(
          dailyTransactionLimit: 10000.0,
          monthlyTransactionLimit: 50000.0,
          singleTransactionLimit: 5000.0,
          dailyTransactionCount: 50,
          monthlyTransactionCount: 500,
        ),
      ),
    ];
  }

  List<Transaction> _createMockTransactions() {
    return [
              Transaction(
        id: 'mock_transaction_001',
        userId: 'mock_user_001',
        type: TransactionType.receive,
        status: TransactionStatus.completed,
        amount: 1000.00,
        currency: 'USD',
        description: 'Salary payment',
        category: TransactionCategory.salary,
        createdAt: DateTime(2024, 1, 1),
      ),
    ];
  }

  // Update user profile
  Future<void> updateUserProfile(User updatedUser) async {
    _setLoading(true);
    _clearError();
    
    try {
      // TODO: Implement actual API call
      await Future.delayed(const Duration(seconds: 1));
      
      _currentUser = updatedUser;
      _setLoading(false);
      notifyListeners();
    } catch (e) {
      _setError('Failed to update profile: $e');
      _setLoading(false);
    }
  }

  // Refresh data
  Future<void> refreshData() async {
    if (_isAuthenticated) {
      await _loadUserData();
    }
  }
}
