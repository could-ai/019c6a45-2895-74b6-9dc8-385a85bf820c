import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/products/product_list_screen.dart';
import 'screens/products/product_detail_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/wishlist/wishlist_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/orders/order_history_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/products': (context) => const ProductListScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/orders': (context) => const OrderHistoryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/search': (context) => const SearchScreen(),
        '/admin': (context) => const AdminDashboardScreen(),
      },
    );
  }
}