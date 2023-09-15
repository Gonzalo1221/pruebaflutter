import 'package:flutter/material.dart';

void main() {

   final List<ListItem> items = [
    HeadingItem('Lista de regalos'),
    HeadingItem('HOGAR'),
    MessageItem('','-Vajilla'),
    MessageItem('','-Vasos'),
    MessageItem('','-Copas de Vidrio'),
    MessageItem('','-Licuadora'),
    MessageItem('','-Lavadora'),
    MessageItem('','-Colchon'),
    //AQUI SE SEPARA LA LISTA PARA DAR PASO A OTRA CATEGORIA
    HeadingItem('MODA'),
    MessageItem('','-Vestido'),
    MessageItem('','-Corbata'),
    MessageItem('','-Zapatos'),
    MessageItem('','-Bolso'),
    MessageItem('','-Traje de Baño'),
    //ESPACIO ENTRE CATEGORIAS
    HeadingItem('ACCESORIOS'),
    MessageItem('','-Aretes'),
    MessageItem('','-Reloj'),
    MessageItem('','-Gafas'),
    MessageItem('','-Collar'),
    //ESPACIO ENTRE CATEGORIAS
    HeadingItem('TECNOLOGIA'),
    MessageItem('','-Portatil'),
    MessageItem('','-iPods Audifonos'),
    //ESPACIO ENTRE CATEGORIAS
    HeadingItem('OTROS'),
    MessageItem('','-Decoracion'),
    MessageItem('','-Carro'),
    MessageItem('','-Viaje'),
  ];

  runApp(MyApp(items: items));
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
