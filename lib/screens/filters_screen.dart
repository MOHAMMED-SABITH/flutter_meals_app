import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  Function? updateValue;

  @override
  void initState() {
    _glutenFree = (widget.currentFilters['gluten']) as bool;
    _lactoseFree = (widget.currentFilters['lactose']) as bool;
    _vegetarian = (widget.currentFilters['vegetarian']) as bool;
    _vegan = (widget.currentFilters['vegan']) as bool;
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchTitle(
    String title,
    String description,
    bool currentvalue,
    updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentvalue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust yor meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchTitle(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              _buildSwitchTitle(
                'Lactose-free',
                'Only include Lactose-free meals',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchTitle(
                'Vegetarian',
                'Only include Vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchTitle(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
