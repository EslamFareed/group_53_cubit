import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/counter/counter_cubit.dart';
import 'package:flutter_application_4/cubits/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: MainCubit.get(context).isDark,
              onChanged: (value) {
                MainCubit.get(context).changeTheme();
              },
            ),

            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    CounterCubit.get(context).changeFav();
                  },
                  icon: Icon(
                    CounterCubit.get(context).fav
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.red,
                  ),
                );
              },
            )

            // BlocConsumer<CounterCubit, CounterState>(
            //   builder: (context, state) {
            //     print(state);
            //     return Text(
            //       "${CounterCubit.get(context).counter}",
            //       style: TextStyle(
            //         fontSize: 40,
            //         color: state is IncrementState ? Colors.green : Colors.red,
            //       ),
            //     );
            //   },
            //   listener: ((context, state) {}),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     CounterCubit.get(context).increment();
            //     // counter++;
            //     // setState(() {});
            //   },
            //   child: Text("+"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     CounterCubit.get(context).decrement();
            //     // counter--;
            //     // setState(() {});
            //   },
            //   child: Text("-"),
            // )
          ],
        ),
      ),
    );
  }
}
