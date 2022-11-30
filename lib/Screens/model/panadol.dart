import 'package:flutter/material.dart';
import 'package:skeleton_prototype/components/expandable.dart';

class Panadol extends StatelessWidget {
  const Panadol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Panadol"),
        actions: [IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
        )],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                height: 240.0,
                width: 240.0,
                child: Image.asset('assets/icons/panadol.jpg'),
              ),
              Text(
                "1. Name of the medicinal product",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text: "Panadol Original Tablets",
              ),
              // Text(
              //   "Panadol Original Tablets",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "2. Qualitative and quantitative composition",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text: "Each tablet contains Paracetamol Ph Eur 500.0 mg",
              ),
              // Text(
              //   "Each tablet contains Paracetamol Ph Eur 500.0 mg",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "3. Pharmaceutical form",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Tablet | White, film-coated capsule shaped tablet with a triangular logo debossed on one side and a break line on the other.",
              ),
              // Text(
              //   "Tablet | White, film-coated capsule shaped tablet with a triangular logo debossed on one side and a break line on the other.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.1 Therapeutic indications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Panadol Original Tablets is a mild analgesic and antipyretic, and is recommended for the treatment of most painful and febrile conditions, for example, headache including migraine and tension headaches, toothache, backache, rheumatic and muscle pains, dysmenorrhoea, sore throat, and for relieving the fever, aches and pains of colds and flu. Also recommended for the symptomatic relief of pain due to non-serious arthritis.",
              ),
              // Text(
              //   "Panadol Original Tablets is a mild analgesic and antipyretic, and is recommended for the treatment of most painful and febrile conditions, for example, headache including migraine and tension headaches, toothache, backache, rheumatic and muscle pains, dysmenorrhoea, sore throat, and for relieving the fever, aches and pains of colds and flu. Also recommended for the symptomatic relief of pain due to non-serious arthritis.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.2 Posology and method of administration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Adults, the elderly, and children aged 16 years and over: | One or two tablets up to four times daily as required. | Children: | Aged 10 - 15 years: One tablet up to four times daily as required. | Not suitable for children under 10 years of age. Children should not be given Panadol Original Tablets for more than 3 days without consulting a doctor. | These doses should not be repeated more frequently than every four hours nor should more than four doses be given in any 24 hour period. | Oral administration only.",
              ),
              // Text(
              //   "Adults, the elderly, and children aged 16 years and over: | One or two tablets up to four times daily as required. | Children: | Aged 10 - 15 years: One tablet up to four times daily as required. | Not suitable for children under 10 years of age. Children should not be given Panadol Original Tablets for more than 3 days without consulting a doctor. | These doses should not be repeated more frequently than every four hours nor should more than four doses be given in any 24 hour period. | Oral administration only.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.3 Contraindications",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Hypersensitivity to paracetamol or any of the other constituents.",
              ),
              // Text(
              //   "Hypersensitivity to paracetamol or any of the other constituents.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.4 Interaction with other medicinal products and other forms of interaction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "The speed of absorption of paracetamol may be increased by metoclopramide or domperidone and absorption reduced by colestyramine. The anticoagulant effect of warfarin and other coumarins may be enhanced by prolonged regular daily use of paracetamol with increased risk of bleeding; occasional doses have no significant effect.",
              ),
              // Text(
              //   "The speed of absorption of paracetamol may be increased by metoclopramide or domperidone and absorption reduced by colestyramine. The anticoagulant effect of warfarin and other coumarins may be enhanced by prolonged regular daily use of paracetamol with increased risk of bleeding; occasional doses have no significant effect.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.5 Pregnancy and lactation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Paracetamol is excreted in breast milk but not in a clinically significant amount in recommended dosages. Available published data do not contraindicate breastfeeding.",
              ),
              // Text(
              //   "Paracetamol is excreted in breast milk but not in a clinically significant amount in recommended dosages. Available published data do not contraindicate breastfeeding.",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "4.6 Overdose",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandableText(
                text:
                    "Paracetamol overdose may cause liver failure which may require liver transplant or lead to death. | Liver damage is possible in adults who have taken 10g or more of paracetamol. Ingestion of 5g or more of paracetamol may lead to liver damage if the patient has risk factors (see below).",
              ),
              // Text(
              //   "Paracetamol overdose may cause liver failure which may require liver transplant or lead to death. | Liver damage is possible in adults who have taken 10g or more of paracetamol. Ingestion of 5g or more of paracetamol may lead to liver damage if the patient has risk factors (see below).",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 14.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
