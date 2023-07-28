import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/brick.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/concrete_works.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/painting.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/plastering.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/roofing.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/stone.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/brick_works_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/concrete_work_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/plastering_work_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/painting_work_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/plumbing_work_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/roofing_work_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/site_clearance_web.dart';
import 'package:ccts/src/presentation/web_ui/view/side_bar/cost_estimation_web/stone_work_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../presentation/mobile_ui/view/cost_estimation/site_clerance.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/plumbing_works.dart';

var data1 = [
  'Ropani',
  'Anna',
  'Paisa',
  'Dam'
];

var data2 = [
  'Bigha',
  'Kattha',
  'Dhur',
  'More'
];

var enginners =[
  {
    'image' : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Shakya Hernandez",
    'description' : "She is the Best.",
    'rating' : 'Vip'
  },
  {
    'image' : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Jack Michelle",
    'description' : "She is Bad.",
    'rating' : 'Good'
  },
  {
    'image' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Ester Esp",
    'description' : "She is Good.",
    'rating' : 'Bad'
  },
  {
    'image' : "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Hanni Danielle",
    'description' : "She is Good.",
    'rating' : 'Good'
  },
  {
    'image' : "https://images.pexels.com/photos/1898555/pexels-photo-1898555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Thakur Xavier",
    'description' : "He is Ok.",
    'rating' : 'Bad'
  },
  {
    'image' : "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Hyein Kelly",
    'description' : "He is Good.",
    'rating' : 'Good'
  },
];

var blog =[
  {
    'name' : "Shehul Magar",
    'createdAt' : "2000/12/10",
    'imageUrl' : "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
    'profileImageUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'blogTitle' : "5 Ropani Land for sale! 5 Ropani Land for sale!5 Ropani Land for sale!5 Ropani Land for sale!5 Ropani Land for sale!5 Ropani Land for sale!",
    'blogInfo' : "It is a good Quality landasdf asd fas df asdfas dfasd fas dfasdfasdfffffffffffffffffffffffffffffff af sdfas fasd f.",
    'profileStatus' : 'Active',
    'blogStatus' : 'New',
    'userId' : 'a'
  },
  {
    'name' : "Gero Hero",
    'createdAt' : "2000/12/10",
    'imageUrl' : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'profileImageUrl' : "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
    'blogTitle' : "5 Ropani Land for sale!",
    'blogInfo' : "It is a good Quality land.",
    'profileStatus' : '',
    'blogStatus' : 'New',
    'userId' : '1'
  },
  {
    'name' : "Adrv Magar",
    'createdAt' : "2000/12/10",
    'imageUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'profileImageUrl' : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'blogTitle' : "5 Ropani Land for sale!",
    'blogInfo' : "It is a good Quality land.",
    'profileStatus' : 'Active',
    'blogStatus' : 'New',
    'userId' : 'c'
  },
  {
    'name' : "Rilon Magar",
    'createdAt' : "2000/12/10",
    'imageUrl' : "https://images.pexels.com/photos/2064693/pexels-photo-2064693.jpeg?auto=compress&cs=tinysrgb&w=600",
    'profileImageUrl' : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'blogTitle' : "5 Ropani Land for sale!",
    'blogInfo' : "It is a good Quality land.",
    'profileStatus' : 'Active',
    'blogStatus' : '',
    'userId' : 's'
  },
  {
    'name' : "Sachin Magar",
    'createdAt' : "2000/12/10",
    'imageUrl' : "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'profileImageUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'blogTitle' : "5 Ropani Land for sale!",
    'blogInfo' : "It is a good Quality land.",
    'profileStatus' : 'Active',
    'blogStatus' : 'New',
    'userId' : 'e'
  },
];

var material= [
  {
    "title":"driller",
    "unit":'10.0' ,
    "price":'100/hour'
  }
];

var labour= [
  {
    "title":"name",
    "unit":'10.0' ,
    "price":'1000'
  }
];

var category = [
  {
    'image' : "https://images.pexels.com/photos/1116035/pexels-photo-1116035.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Site Clerance",
    'page' : kIsWeb ? const SiteCleranceWeb() : const SiteClerance(),
    'category_id' : "1",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/2471313/pexels-photo-2471313.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Brick",
    'page' : kIsWeb ? const BrickCalculationWeb() : const BrickCalculation(),
    'category_id' : "2",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/194096/pexels-photo-194096.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Stone",
    'page' : kIsWeb ? const StoneCalculationWeb() : const StoneCalculation(),
    'category_id' : "3",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/221027/pexels-photo-221027.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'name' : "Painting",
    'page' : kIsWeb ? const PaintingWorkWeb() : const Painting(),
    'category_id' : "4",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/5691606/pexels-photo-5691606.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Plastering",
    'page' : kIsWeb ? const PlasteringWorksWeb() : const Plastering(),
    'category_id' : "5",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/10161111/pexels-photo-10161111.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Roofing",
    'page' : kIsWeb ? const RoofingWorkWeb() : const Roofing(),
    'category_id' : "6",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/5240607/pexels-photo-5240607.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Plumbing",
    'page' : kIsWeb ? const PlumbingWorksWeb() : const PlumbingWorks(),
    'category_id' : "7",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
  {
    'image' : "https://images.pexels.com/photos/1451416/pexels-photo-1451416.jpeg?auto=compress&cs=tinysrgb&w=600",
    'name' : "Concrete",
    'page' : kIsWeb ? const ConcreteWorkWeb() : const ConcreteWorks(),
    'category_id' : "8",
    'labour' : [
      {
        "title" : "Normal Labour", 
        "unit" : "0.8", 
      },
      {
        "title" : "Skilled Labour", 
        "unit" : "0.8", 
      }
    ],
    'material' : [
      {
        "title" : "Stone", 
        "unit" : "2kg", 
      },
      {
        "title" : "Rope", 
        "unit" : "50 pices", 
      }
    ],
    'machine' : [
      {
        "title" : "Dozer", 
        "unit" : "1", 
      },
      {
        "title" : "Drill", 
        "unit" : "3", 
      }
    ],
  },
];

var district = [
 "Bhojpur",
 "Dhankuta",
 "Ilam",
 "Jhapa",
 "Khotang",
 "Morang",
 "Okhaladhunga",
 "Panchthar",
 "Sankhuwasabha",
 "Solukhumbu",
 "Sunsari",
 "Sunsari",
 "Taplejung",
 "Terhathum",
 "Udayapur",
 "Bara",
 "Dhanusha",
 "Mahottari",
 "Parsa",
 "Rautahat",
 "Saptari",
 "Sarlahi",
 "Siraha",
 "Bhaktapur",
 "Chitawan",
 "Dhading",
 "Dolakha",
 "Kathmandu",
 "Kavrepalanchok",
 "Lalitpur",
 "Makwanpur",
 "Nuwakot",
 "Ramechhap",
 "Rasuwa",
 "Sindhuli",
 "Sindhupalchok",
 "Baglung",
 "Gorkha",
 "Kaski",
 "Lamjung",
 "Manang",
 "Mustang",
 "Myagdi",
 "Nawalpur",
 "Parbat",
 "Syangja",
 "Tanahu",
 "Arghakhanchi",
 "Banke",
 "Bardiya",
 "Dang",
 "Gulmi",
 "Kapilbastu",
 "Nawalparasi",
 "Palpa",
 "Pyuthan",
 "Rolpa",
 "Rukum Purba",
 "Rupandehi",
 "Dailekh",
 "Dolpa",
 "Humla",
 "Jajarkot",
 "Jumla",
 "Kalikot",
 "Mugu",
 "Rukum Paschim",
 "Salyan",
 "Surkhet",
 "Achham",
 "Baitadi",
 "Bajhang",
 "Bajura",
 "Dadeldhura",
 "Darchula",
 "Doti",
 "Kailali",
 "Kanchanpur",
];

var jsonSiteList = [
  {
    "siteTitle" : "Random",
    "layout" :[
      {
        "layoutTitle" : "1.10. Layout and Settings inc Site Clerence",
        "labourList" : [
          {
            "quantity" : 1,
            "labourTopic" : "Skilled",
            "cost" : "Rs.100",
          },
          {
            "quantity" : 1,
            "labourTopic" : "Helper",
            "cost" : "Rs.100",
          },
        ],
        "materialList" : [
          {
            "quantity" :1,
            "materailName" : "Cement",
            "cost" : "Rs.900",
          }
        ]
      },
      {
        "layoutTitle" : "1.20. Layout and Settings inc Site Clerence",
        "labourList" : [
          {
            "quantity" : 1,
            "labourTopic" : "Skilled",
            "cost" : "Rs.100",
          },
        ],
        "materialList" : [
          {
            "quantity" :2,
            "materailName" : "Cement",
            "cost" : "Rs.900",
          },
        ]
      }
    ], 
  }
];

var workCategory = [
  'Earth Work',
  'Concrete Work',
  'Painting Work',
];


var earthWorkItems = [
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "Includes Labour and Material"
  },
  {
    "title" :  "1.20. EARTHWORK IN EXCAVATION IN FOUNDATION ETC. INCLUDING DRESSING OF SIDES LIFT UPTO 2.00 MTS. AND STACKING OF EXCAVATED MATERIALS",
    "description" : "Includes Labour and Material"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
];

var concreteWorkItems = [
  {
    "title" : "1.10. CONCRETE LAYOUT",
    "description" : "Includes Labour and Material"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
];

var paintingWorkItems = [
  {
    "title" : "1.10. PAINTING LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "Includes Labour and Material"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
  {
    "title" : "1.10. LAYOUT AND SETTING OUT OF THE BUILDING INCLUDING SITE CLEARANCE",
    "description" : "No description available"
  },
];

var sideNavItems = [
    {
      "itemName" : "Category",
      "itemIcon" : const Icon(Icons.home, size: 18.0,)
    },
    {
      "itemName" : "Calculator",
      "itemIcon" : const Icon(Icons.edit_calendar, size: 18.0,)
    },
    {
      "itemName" : "Misc",
      "itemIcon" : const Icon(Icons.edit, size: 18.0,)
    }
];

List<Map<String, dynamic>>  siteClerancePrice = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "1200",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1200",
  }
];

List<Map<String, dynamic>>  brickRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "brickPrice" : "16",
    "sandPrice" : "2200",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "brickPrice" : "16",
    "sandPrice" : "2200",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "brickPrice" : "18",
    "sandPrice" : "1900",
  }
];

List<Map<String, dynamic>>  stoneRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "stonePrice" : "1600",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "stonePrice" : "1800",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "stonePrice" : "2000",
  }
];

List<Map<String, dynamic>>  paintingRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "lime" : "33.9",
    "gum" : "259",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "lime" : "31.9",
    "gum" : "200",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "lime" : "29.9",
    "gum" : "159",
  }
];

List<Map<String, dynamic>>  roofingRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "cgiSheets" : "450",
    "nutbolt" : "172",
    "jhook" : "52",
    "washer" : "12",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "cgiSheets" : "455",
    "nutbolt" : "180",
    "jhook" : "49",
    "washer" : "10",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "cgiSheets" : "449",
    "nutbolt" : "100",
    "jhook" : "51",
    "washer" : "12",
  }
];

List<Map<String, dynamic>>  plasteringRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "cementPrice" : "1700",
    "sandPrice" : "2050",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "cementPrice" : "900",
    "sandPrice" : "2000",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "cementPrice" : "1900",
    "sandPrice" : "2090",
  }
];

List<Map<String, dynamic>>  concreteRate = [
  {
    "name" : "Bhojpur",
    "labourPrice" : "800",
    "skilledLabourPrice" : "1000",
    "agg40mm" : "1820",
    "agg20mm" : "1900",
    "cementPrice" : "1500",
    "sandPrice" : "2050",
  },
  {
    "name" : "Lalitpur",
    "labourPrice" : "1200",
    "skilledLabourPrice" : "1400",
    "agg40mm" : "1800",
    "agg20mm" : "1700",
    "cementPrice" : "1300",
    "sandPrice" : "2050",
  },
  {
    "name" : "Kathmandu",
    "labourPrice" : "1100",
    "skilledLabourPrice" : "1300",
    "agg40mm" : "1890",
    "agg20mm" : "1910",
    "cementPrice" : "700",
    "sandPrice" : "2050",
  }
];

var municipalityList = [
  {
    "label": "Bhojpur",
    "value": "Bhojpur"
  },
  {
    "label": "Dhankuta",
    "value": "Dhankuta"
  },
  {
    "label": "Ilam",
    "value": "Ilam"
  },
  {
    "label": "Jhapa",
    "value": "Jhapa"
  },
  {
    "label": "Khotang",
    "value": "Khotang"
  },
  {
    "label": "Morang",
    "value": "Morang"
  },
  {
    "label": "Okhaladhunga",
    "value": "Okhaladhunga"
  },
  {
    "label": "Panchthar",
    "value": "Panchthar"
  },
  {
    "label": "Sankhuwasabha",
    "value": "Sankhuwasabha"
  },
  {
    "label": "Solukhumbu",
    "value": "Solukhumbu"
  },
  {
    "label": "Sunsari",
    "value": "Sunsari"
  },
  {
    "label": "Taplejung",
    "value": "Taplejung"
  },
  {
    "label": "Terhathum",
    "value": "Terhathum"
  },
  {
    "label": "Udayapur",
    "value": "Udayapur"
  },
  {
    "label": "Bara",
    "value": "Bara"
  },
  {
    "label": "Dhanusha",
    "value": "Dhanusha"
  },
  {
    "label": "Mahottari",
    "value": "Mahottari"
  },
  {
    "label": "Parsa",
    "value": "Parsa"
  },
  {
    "label": "Rautahat",
    "value": "Rautahat"
  },
  {
    "label": "Saptari",
    "value": "Saptari"
  },
  {
    "label": "Sarlahi",
    "value": "Sarlahi"
  },
  {
    "label": "Siraha",
    "value": "Siraha"
  },
  {
    "label": "Bhaktapur",
    "value": "Bhaktapur"
  },
  {
    "label": "Chitawan",
    "value": "Chitawan"
  },
  {
    "label": "Dhading",
    "value": "Dhading"
  },
  {
    "label": "Dolakha",
    "value": "Dolakha"
  },
  {
    "label": "Kathmandu",
    "value": "Kathmandu"
  },
  {
    "label": "Kavrepalanchok",
    "value": "Kavrepalanchok"
  },
  {
    "label": "Lalitpur",
    "value": "Lalitpur"
  },
  {
    "label": "Makwanpur",
    "value": "Makwanpur"
  },
  {
    "label": "Nuwakot",
    "value": "Nuwakot"
  },
  {
    "label": "Ramechhap",
    "value": "Ramechhap"
  },
  {
    "label": "Rasuwa",
    "value": "Rasuwa"
  },
  {
    "label": "Sindhuli",
    "value": "Sindhuli"
  },
  {
    "label": "Sindhupalchok",
    "value": "Sindhupalchok"
  },
  {
    "label": "Baglung",
    "value": "Baglung"
  },
  {
    "label": "Gorkha",
    "value": "Gorkha"
  },
  {
    "label": "Kaski",
    "value": "Kaski"
  },
  {
    "label": "Lamjung",
    "value": "Lamjung"
  },
  {
    "label": "Manang",
    "value": "Manang"
  },
  {
    "label": "Mustang",
    "value": "Mustang"
  },
  {
    "label": "Myagdi",
    "value": "Myagdi"
  },
  {
    "label": "Nawalpur",
    "value": "Nawalpur"
  },
  {
    "label": "Parbat",
    "value": "Parbat"
  },
  {
    "label": "Syangja",
    "value": "Syangja"
  },
  {
    "label": "Tanahu",
    "value": "Tanahu"
  },
  {
    "label": "Arghakhanchi",
    "value": "Arghakhanchi"
  },
  {
    "label": "Banke",
    "value": "Banke"
  },
  {
    "label": "Bardiya",
    "value": "Bardiya"
  },
  {
    "label": "Dang",
    "value": "Dang"
  },
  {
    "label": "Gulmi",
    "value": "Gulmi"
  },
  {
    "label": "Kapilbastu",
    "value": "Kapilbastu"
  },
  {
    "label": "Nawalparasi",
    "value": "Nawalparasi"
  },
  {
    "label": "Palpa",
    "value": "Palpa"
  },
  {
    "label": "Pyuthan",
    "value": "Pyuthan"
  },
  {
    "label": "Rolpa",
    "value": "Rolpa"
  },
  {
    "label": "Rukum Purba",
    "value": "Rukum Purba"
  },
  {
    "label": "Rupandehi",
    "value": "Rupandehi"
  },
  {
    "label": "Dailekh",
    "value": "Dailekh"
  },
  {
    "label": "Dolpa",
    "value": "Dolpa"
  },
  {
    "label": "Humla",
    "value": "Humla"
  },
  {
    "label": "Jajarkot",
    "value": "Jajarkot"
  },
  {
    "label": "Jumla",
    "value": "Jumla"
  },
  {
    "label": "Kalikot",
    "value": "Kalikot"
  },
  {
    "label": "Mugu",
    "value": "Mugu"
  },
  {
    "label": "Rukum Paschim",
    "value": "Rukum Paschim"
  },
  {
    "label": "Salyan",
    "value": "Salyan"
  },
  {
    "label": "Surkhet",
    "value": "Surkhet"
  },
  {
    "label": "Achham",
    "value": "Achham"
  },
  {
    "label": "Baitadi",
    "value": "Baitadi"
  },
  {
    "label": "Bajhang",
    "value": "Bajhang"
  },
  {
    "label": "Bajura",
    "value": "Bajura"
  },
  {
    "label": "Dadeldhura",
    "value": "Dadeldhura"
  },
  {
    "label": "Darchula",
    "value": "Darchula"
  },
  {
    "label": "Doti",
    "value": "Doti"
  },
  {
    "label": "Kailali",
    "value": "Kailali"
  },
  {
    "label": "Kanchanpur",
    "value": "Kanchanpur"
  }
];

var projectDetail=[
  {
    'est_plastering_start_date':"2023-04-12",
    'est_plastering_end_date':"2023-04-25",
    'est_brick_join_start_date':"2023-04-26",
    'est_brick_join_end_date':"2023-05-26",
    'est_painting_start_date':"2023-05-30",
    'est_painting_end_date':"2023-06-05",
    'est_roofing_start_date':"2023-06-08",
    'est_roofing_end_date':"2023-07-08",
  }
];


var projects =[
  {
    'projectTitle' : "Mulyankan",
    'clientName' : "Shakya Hernandez",
    'address' : 'Chitwan, Nepal',
    'district' : 'Chitwan',    
    'clientEmail' : "sad.nbujn@gmail.com",
    'clientPhone' : "98611515",
    'totalSiteArea' : "128m",
    'totalBuildingArea' : "15m",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },
  {
    'projectTitle' : "CCTS",
    'clientName' : "Rilon Hernandez",
    'address' : 'Lalitpur, Nepal',
    'district' : 'Lalitpur',    
    'clientEmail' : "sad.nbujn@gmail.com",
    'clientPhone' : "986113423515",
    'totalSiteArea' : "132328m",
    'totalBuildingArea' : "315m",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },  {
    'projectTitle' : "Project X",
    'clientName' : "Shakya Enmksd",
    'address' : 'Syangja, Nepal',
    'district' : 'Syangja',   
    'clientEmail' : "sad.nbujn@gmail.com",
    'clientPhone' : "98611515",
    'totalSiteArea' : "128m",
    'totalBuildingArea' : "15m",
    "est_starting_date":"4/12/2023",
    "est_completion_date":"4/12/2025",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },  {
    'projectTitle' : "Goda",
    'clientName' : "Anmo Park",
    'address' : 'Bhaktapur, Nepal',
    'district' : 'Bhaktapur',
    'clientEmail' : "sad.nbujn@gmail.com",
    'clientPhone' : "98623411515",
    'totalSiteArea' : "12348m",
    'totalBuildingArea' : "115m",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },  {
    'projectTitle' : "Waint",
    'clientName' : "Rbjs Enmksd",
    'address' : 'Kathamndu, Nepal',
    'district' : 'Kathamndu',
    'clientEmail' : "sad.nbujn@gmail.com",
    'clientPhone' : "9866511658515",
    'totalSiteArea' : "125678m",
    'totalBuildingArea' : "1865m",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },  {
    'projectTitle' : "FindsNp",
    'clientName' : "Box Nular",
    'address' : 'Lalitpur, Nepal',
    'district' : 'Lalitpur',    
    'clientEmail' : "box.nbujn@gmail.com",
    'clientPhone' : "98615671515",
    'totalSiteArea' : "126578m",
    'totalBuildingArea' : "15m",
    'totalEstBudget' : 'Rs. 500,000',
    'lalpurjaImg' : "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    'buildingImg' : "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  },
];



var workShowcaseList = [
  {
    'blogId' : "ws1",
    'userId' : "ws1",
    'blogTitle' : "Around Kathmandu, a really fine land for sale with good ambience",
    'blogDescription' : "Around Kathmandu, a really fine land for sale with good ambience \n\n Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience. Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience",
    'userProfileImgUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'userName' : "Hero Daka",
    'blogStatus' : "New",
    'blogImages' : [
      "https://dam-assets.au.reastatic.net/images/w_2000,h_1500/v1666226657/news-lifestyle-content-assets/wp-content/production/image-10_787815ed2d9/image-10_787815ed2d9.jpg?_i=AA",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    ],
    'createdAt' : "2022-04-17",
  },
  {
    'blogId' : "ws2",
    'userId' : "ws2",
    'blogStatus' : "New",
    'blogTitle' : "Around Kathmandu, a really fine land for sale with good ambience",
    'blogDescription' : "Around Kathmandu, a really fine land for sale with good ambience \n\n Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience. Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience",
    'userProfileImgUrl' : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'userName' : "Ashim",
    'blogImages' : [
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    ],
    'createdAt' : "2022-04-17",
  },
  {
    'blogId' : "ws3",
    'userId' : "ws3",
    'blogStatus' : "New",
    'blogTitle' : "Around Kathmandu, a really fine land for sale with good ambience",
    'blogDescription' : "Around Kathmandu, a really fine land for sale with good ambience Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience",
    'userProfileImgUrl' : "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",
    'userName' : "Superman",
    'blogImages' : [
      "https://dam-assets.au.reastatic.net/images/w_2000,h_1500/v1666226657/news-lifestyle-content-assets/wp-content/production/image-10_787815ed2d9/image-10_787815ed2d9.jpg?_i=AA",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    ],
    'createdAt' : "2022-04-17",
  },
  {
    'blogId' : "ws4",
    'userId' : "ws4",
    'blogStatus' : "New",
    'blogTitle' : "Around Kathmandu, a really fine land for sale with good ambience",
    'blogDescription' : "Around Kathmandu, a really fine land for sale with good ambience \n\n Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience. Around Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambienceAround Kathmandu, a really fine land for sale with good ambience",
    'userProfileImgUrl' : "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    'userName' : "asdads",
    'blogImages' : [
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
      "https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "https://groups.google.com/group/ktmktm/attach/45e7f7d214803/Lal%20Purja.jpg?part=0.1",
    ],
    'createdAt' : "2022-04-17",
  },
];

var cctsCurrentUserId = "1";
