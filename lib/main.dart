import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(const FreshGreenApp());

class FreshGreenApp extends StatelessWidget {
  const FreshGreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FreshGreen',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Giriş denemesi (demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          // Premium background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF061A14),
                  Color(0xFF0E3B2E),
                  Color(0xFF1B7F5C),
                ],
              ),
            ),
          ),
          Positioned(top: -80, left: -60, child: _GlowBlob(diameter: size.width * 0.7)),
          Positioned(bottom: -120, right: -80, child: _GlowBlob(diameter: size.width * 0.8)),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),

                      // LOGO: drop outline + water puddle + seedling coming out of water
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          _FreshGreenBadge(size: 78),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'FreshGreen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Akıllı sera ve sürdürülebilir tarım',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.white.withOpacity(0.75),
                        ),
                      ),

                      const SizedBox(height: 26),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.white.withOpacity(0.18)),
                            ),
                            child: Column(
                              children: [
                                _PremiumTextField(
                                  controller: _emailCtrl,
                                  hintText: 'Email',
                                  icon: Icons.alternate_email_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 12),
                                _PremiumTextField(
                                  controller: _passCtrl,
                                  hintText: 'Şifre',
                                  icon: Icons.lock_rounded,
                                  obscureText: _obscure,
                                  suffix: IconButton(
                                    onPressed: () => setState(() => _obscure = !_obscure),
                                    icon: Icon(
                                      _obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (v) => setState(() => _rememberMe = v ?? true),
                                      activeColor: const Color(0xFF34E89E),
                                      side: BorderSide(color: Colors.white.withOpacity(0.5)),
                                      checkColor: const Color(0xFF061A14),
                                    ),
                                    Text(
                                      'Beni hatırla',
                                      style: TextStyle(color: Colors.white.withOpacity(0.85)),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Şifremi unuttum',
                                        style: TextStyle(
                                          color: Color(0xFF9AF2EA),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  height: 52,
                                  child: ElevatedButton(
                                    onPressed: _onLogin,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF34E89E),
                                      foregroundColor: const Color(0xFF061A14),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    ),
                                    child: const Text(
                                      'Giriş Yap',
                                      style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.white.withOpacity(0.25)),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: const Text(
                                    'Kayıt Ol',
                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                      Text(
                        '© ${DateTime.now().year} FreshGreen',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 12.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Badge: translucent rounded square + custom painted logo
class _FreshGreenBadge extends StatelessWidget {
  final double size;
  const _FreshGreenBadge({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        color: Colors.white.withOpacity(0.10),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 22,
            offset: Offset(0, 12),
            color: Color(0x33000000),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.28),
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _GlossPainter())),
            Center(
              child: CustomPaint(
                size: Size(size * 0.68, size * 0.68),
                painter: _FreshGreenLogoPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Drop outline + water puddle (oval) + seedling coming out of the water
class _FreshGreenLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // --- Drop path ---
    final drop = Path()
      ..moveTo(w * 0.50, h * 0.05)
      ..cubicTo(w * 0.30, h * 0.30, w * 0.20, h * 0.47, w * 0.20, h * 0.63)
      ..cubicTo(w * 0.20, h * 0.87, w * 0.36, h * 0.98, w * 0.50, h * 0.98)
      ..cubicTo(w * 0.64, h * 0.98, w * 0.80, h * 0.87, w * 0.80, h * 0.63)
      ..cubicTo(w * 0.80, h * 0.47, w * 0.70, h * 0.30, w * 0.50, h * 0.05)
      ..close();

    // Fill white
    canvas.drawPath(drop, Paint()..color = Colors.white);

    // Blue gradient outline
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.095
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF2CB6F3),
          Color(0xFF1E88E5),
          Color(0xFF0B2A7A),
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawPath(drop, outline);

    // Keep everything inside the drop
    canvas.save();
    canvas.clipPath(drop);

    final cx = w * 0.50;
    final puddleY = h * 0.78;

    // --- Water puddle (oval) ---
    final puddleRect = Rect.fromCenter(
      center: Offset(cx, puddleY),
      width: w * 0.46,
      height: h * 0.12,
    );

    final puddlePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.85,
        colors: [
          const Color(0xFF64B5F6).withOpacity(0.55),
          const Color(0xFF1E88E5).withOpacity(0.35),
          const Color(0xFF0B2A7A).withOpacity(0.22),
        ],
      ).createShader(puddleRect);

    canvas.drawOval(puddleRect, puddlePaint);

    // water shine
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx - w * 0.06, puddleY - h * 0.02),
        width: w * 0.18,
        height: h * 0.05,
      ),
      Paint()..color = Colors.white.withOpacity(0.25),
    );

    // ============================================================
    // 🌱 Seedling coming OUT OF the water:
    // bottom of stem starts slightly INSIDE the oval,
    // then rises above it.
    // ============================================================

    // Stem path: start inside water -> go up
    final stemPath = Path()
      ..moveTo(cx, puddleY + h * 0.01) // inside the water
      ..quadraticBezierTo(cx + w * 0.03, h * 0.62, cx, h * 0.48);

    final stemPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.040
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB9F06A),
          Color(0xFF2E9E2E),
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawPath(stemPath, stemPaint);

    // Leaf helper
    Path leaf({
      required Offset start,
      required Offset tip,
      required Offset ctrl1,
      required Offset ctrl2,
    }) {
      return Path()
        ..moveTo(start.dx, start.dy)
        ..quadraticBezierTo(ctrl1.dx, ctrl1.dy, tip.dx, tip.dy)
        ..quadraticBezierTo(ctrl2.dx, ctrl2.dy, start.dx, start.dy)
        ..close();
    }

    final leafFill = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC7FF6B),
          Color(0xFF2E9E2E),
        ],
      ).createShader(Rect.fromLTWH(0, 0, w, h));

    // Leaves anchor
    final anchor = Offset(cx, h * 0.52);

    final leftLeaf = leaf(
      start: Offset(anchor.dx - w * 0.01, anchor.dy + h * 0.02),
      tip: Offset(anchor.dx - w * 0.22, anchor.dy - h * 0.06),
      ctrl1: Offset(anchor.dx - w * 0.13, anchor.dy - h * 0.14),
      ctrl2: Offset(anchor.dx - w * 0.15, anchor.dy + h * 0.02),
    );

    final rightLeaf = leaf(
      start: Offset(anchor.dx + w * 0.01, anchor.dy + h * 0.02),
      tip: Offset(anchor.dx + w * 0.22, anchor.dy - h * 0.06),
      ctrl1: Offset(anchor.dx + w * 0.13, anchor.dy - h * 0.14),
      ctrl2: Offset(anchor.dx + w * 0.15, anchor.dy + h * 0.02),
    );

    canvas.drawPath(leftLeaf, leafFill);
    canvas.drawPath(rightLeaf, leafFill);

    // Leaf highlights
    final leafHighlight = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.010
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withOpacity(0.25);
    canvas.drawPath(leftLeaf, leafHighlight);
    canvas.drawPath(rightLeaf, leafHighlight);

    // ============================================================
    // Mask effect: stem looks like it's coming FROM inside water
    // Draw a thin water "cap" on top of stem at the waterline
    // ============================================================
    final capRect = Rect.fromCenter(
      center: Offset(cx, puddleY - h * 0.005),
      width: w * 0.14,
      height: h * 0.035,
    );

    final capPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF64B5F6).withOpacity(0.55),
          const Color(0xFF1E88E5).withOpacity(0.35),
        ],
      ).createShader(capRect);

    canvas.drawOval(capRect, capPaint);

    // tiny sparkle
    canvas.drawCircle(
      Offset(cx + w * 0.14, puddleY - h * 0.015),
      w * 0.012,
      Paint()..color = Colors.white.withOpacity(0.20),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GlossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0x45FFFFFF), Color(0x00FFFFFF)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.9, size.height * 0.55),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PremiumTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  const _PremiumTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white, fontSize: 15.5),
      cursorColor: const Color(0xFF34E89E),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.85)),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white.withOpacity(0.10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF34E89E), width: 1.2),
        ),
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final double diameter;
  const _GlowBlob({required this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0xFF34E89E).withOpacity(0.35),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}