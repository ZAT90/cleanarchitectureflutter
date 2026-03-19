import 'package:cleanarchitectureflutter/core/network/network_checker/network/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalNetworkWrapper extends StatelessWidget {
  final Widget child;

  const GlobalNetworkWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Your actual app (always visible)
        child,

        // 2. The Global Internet Banner (only when disconnected)
        BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            final isDisconnected = state.maybeWhen(
              disconnected: () => true,
              orElse: () => false,
            );

            if (!isDisconnected) {
              return const SizedBox.shrink();
            }

            return Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Material(
                  elevation: 4,
                  color: Colors.red,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'No Internet Connection',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
