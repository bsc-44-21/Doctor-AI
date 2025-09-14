import 'package:flutter/material.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  final List<Map<String, String>> diseases = const [
    {
      "name": "Northern Leaf Blight",
      "symptoms": "Gray lesions on maize leaves",
      "prevention": "Crop rotation, resistant varieties",
      "treatment": "Fungicide application if severe"
    },
    {
      "name": "Maize Streak Virus",
      "symptoms": "Yellow streaks on leaves",
      "prevention": "Control insect vectors",
      "treatment": "No cure, remove affected plants"
    },
    {
      "name": "Tomato Late Blight",
      "symptoms": "Dark leaf spots, fruit rot",
      "prevention": "Good spacing, avoid wet leaves",
      "treatment": "Use fungicides, remove infected tissue"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Knowledge Base"), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(disease["name"]!),
              subtitle: Text("Symptoms: ${disease["symptoms"]}"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(disease["name"]!),
                    content: Text(
                      "Symptoms: ${disease["symptoms"]}\n\n"
                      "Prevention: ${disease["prevention"]}\n\n"
                      "Treatment: ${disease["treatment"]}",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
