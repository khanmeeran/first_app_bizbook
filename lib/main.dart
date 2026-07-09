import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'models/customer.dart';
import 'models/product.dart';
import 'providers/customer_provider.dart';
import 'providers/product_provider.dart';
import 'screens/authentication/login_screen.dart';
import 'screens/authentication/splash_screen.dart';
import 'screens/authentication/welcome_screen.dart';
import 'screens/customers/customer_detail_screen.dart';
import 'screens/customers/customers_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/payments/payments_screen.dart';
import 'screens/products/product_detail_screen.dart';
import 'screens/products/products_screen.dart';
import 'screens/purchases/purchases_screen.dart';
import 'screens/reports/reports_screen.dart';
import 'screens/sales/sales_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        initialRoute: AppConstants.splashRoute,
        routes: {
          AppConstants.splashRoute: (_) => const SplashScreen(),
          AppConstants.welcomeRoute: (_) => const WelcomeScreen(),
          AppConstants.loginRoute: (_) => const LoginScreen(),
          AppConstants.homeRoute: (_) => const DashboardScreen(),
          AppConstants.productsRoute: (_) => const ProductsScreen(),
          AppConstants.customersRoute: (_) => const CustomersScreen(),
          AppConstants.salesRoute: (_) => const SalesScreen(),
          AppConstants.purchasesRoute: (_) => const PurchasesScreen(),
          AppConstants.paymentsRoute: (_) => const PaymentsScreen(),
          AppConstants.reportsRoute: (_) => const ReportsScreen(),
          AppConstants.settingsRoute: (_) => const SettingsScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == AppConstants.productDetailRoute) {
            final product = settings.arguments as Product;
            return MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product));
          }
          if (settings.name == AppConstants.customerDetailRoute) {
            final customer = settings.arguments as Customer;
            return MaterialPageRoute(builder: (_) => CustomerDetailScreen(customer: customer));
          }
          return null;
        },
      ),
    );
  }
}
