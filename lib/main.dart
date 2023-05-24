import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main()
{
  runApp(const Application());
}


class Application extends StatelessWidget
{
    const Application({ super.key });

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            title: 'Honda Search',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
            ),
            home: const HomePage(),
        );
    }
}


class HomePage extends StatelessWidget
{
    const HomePage({ super.key });

    @override
    Widget build(BuildContext context)
    {
        return const Scaffold(
            body: SearchField(),
        );
    }
}


class SearchField extends StatelessWidget
{
    const SearchField({ super.key });
  
    @override
    Widget build(BuildContext context)
    {
        final theme = Theme.of(context);

        return Center(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 50,
                    right: 50
                ),
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.amberAccent
                    ),
                    child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            prefix: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon( 
                                    Icons.search,
                                    semanticLabel: 'Search',
                                )
                            ),
                            suffix: Padding(
                                padding: EdgeInsets.all(8), 
                                child: Icon(
                                    Icons.qr_code,
                                    semanticLabel: 'Scan',
                                )
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(fontSize: 17),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                        ),
                        inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.singleLineFormatter,
                            FilteringTextInputFormatter.digitsOnly
                        ],
                    ),
                ),
            ),
        );
    }
}