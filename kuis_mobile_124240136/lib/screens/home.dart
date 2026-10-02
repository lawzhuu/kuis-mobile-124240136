import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240136/models/data.dart';
import 'package:kuis_mobile_124240136/screens/detail.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // VARIABE BUAT NAMPUNG KATA KUNCI PENCARIAN
  String _searchQuery = "";
  final Set<int> _favoriteIds = {};

  @override
  Widget build(BuildContext context) {
    // INI UNTUK NGEFILTER MENU BERDASARKAN INPUT KOLOM PENCARIAN 
    final filteredShoes = shoeCatalog.where((menu) {
      return menu.shoeName.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        // INI KOLOM PENCARIAN NYA MAS
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Cari sepatu anda",
              prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        Expanded(
          child: filteredShoes.isEmpty
              ? Center(
                  child: Text(
                    "Menu tidak ditemukan",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredShoes.length,
                  itemBuilder: (context, index) {
                    final menu = filteredShoes[index];
                    final isFavorite = _favoriteIds.contains(menu.id); // INI BUAT NGECEK STATUS FAVORIT 

                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(product: menu),
                            ),
                          );
                        },

                        // NAMPILIN GAMBAR MENU 
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            menu.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // NAMPILIN NAMA MENU 
                        title: Text(
                          menu.shoeName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        // INI NAMPILIN HARGA MENU 
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            menu.price, 
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        
                        
                        

                        // ICON PANAH DAN TOMBOL FAVORIT
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isFavorite) {
                                    _favoriteIds.remove(menu.id);
                                  } else {
                                    _favoriteIds.add(menu.id);
                                  }
                                });
                              },
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}