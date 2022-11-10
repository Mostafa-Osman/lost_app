
//model
import 'package:lost_app/app/common/widgets/bottom_sheet/selectable_item.dart';

class LostCity extends SelectableItem {
  final int governorateId;

  LostCity({
    required int id,
    required String title,
    required this.governorateId,
  }) : super(id: id, title: title);

  factory LostCity.fromJson(Map<String, dynamic> json) {
    return LostCity(
      id: int.parse(json['id'] as String),
      title: json['city_name_ar'] as String,
      governorateId: int.parse(json['governorate_id'] as String),
    );
  }
}

///  / m   لو عاوز كل المدن
List<LostCity> getCities() {
  return cities.map((e) => LostCity.fromJson(e)).toList();
}

// لو عاوز تفلتر المدن بعد ما يختار المحافظة
List<LostCity> getCitiesByGovernorateId(int governorateId) {
  final allCities = cities.map((e) => LostCity.fromJson(e)).toList();
  return allCities.where((e) => e.governorateId == governorateId).toList();
}
int getCitiesByGovernorateName(String governorateName) {
  final allCities = cities.map((e) => LostCity.fromJson(e)).toList();

  for(int i = 0; i < allCities.length; ++i){
    if(allCities[i].title == governorateName) {
      return i;
    }
  }
  return 0;
}

final cities = [
  {
    "id": "1",
    "governorate_id": "1",
    "city_name_ar": "15 مايو",
    "city_name_en": "15 May"
  },
  {
    "id": "2",
    "governorate_id": "1",
    "city_name_ar": "الازبكية",
    "city_name_en": "Al Azbakeyah"
  },
  {
    "id": "3",
    "governorate_id": "1",
    "city_name_ar": "البساتين",
    "city_name_en": "Al Basatin"
  },
  {
    "id": "4",
    "governorate_id": "1",
    "city_name_ar": "التبين",
    "city_name_en": "Tebin"
  },
  {
    "id": "5",
    "governorate_id": "1",
    "city_name_ar": "الخليفة",
    "city_name_en": "El-Khalifa"
  },
  {
    "id": "6",
    "governorate_id": "1",
    "city_name_ar": "الدراسة",
    "city_name_en": "El darrasa"
  },
  {
    "id": "7",
    "governorate_id": "1",
    "city_name_ar": "الدرب الاحمر",
    "city_name_en": "Aldarb Alahmar"
  },
  {
    "id": "8",
    "governorate_id": "1",
    "city_name_ar": "الزاوية الحمراء",
    "city_name_en": "Zawya al-Hamra"
  },
  {
    "id": "9",
    "governorate_id": "1",
    "city_name_ar": "الزيتون",
    "city_name_en": "El-Zaytoun"
  },
  {
    "id": "10",
    "governorate_id": "1",
    "city_name_ar": "الساحل",
    "city_name_en": "Sahel"
  },
  {
    "id": "11",
    "governorate_id": "1",
    "city_name_ar": "السلام",
    "city_name_en": "El Salam"
  },
  {
    "id": "12",
    "governorate_id": "1",
    "city_name_ar": "السيدة زينب",
    "city_name_en": "Sayeda Zeinab"
  },
  {
    "id": "13",
    "governorate_id": "1",
    "city_name_ar": "الشرابية",
    "city_name_en": "El Sharabeya"
  },
  {
    "id": "14",
    "governorate_id": "1",
    "city_name_ar": "مدينة الشروق",
    "city_name_en": "Shorouk"
  },
  {
    "id": "15",
    "governorate_id": "1",
    "city_name_ar": "الظاهر",
    "city_name_en": "El Daher"
  },
  {
    "id": "16",
    "governorate_id": "1",
    "city_name_ar": "العتبة",
    "city_name_en": "Ataba"
  },
  {
    "id": "17",
    "governorate_id": "1",
    "city_name_ar": "القاهرة الجديدة",
    "city_name_en": "New Cairo"
  },
  {
    "id": "18",
    "governorate_id": "1",
    "city_name_ar": "المرج",
    "city_name_en": "El Marg"
  },
  {
    "id": "19",
    "governorate_id": "1",
    "city_name_ar": "عزبة النخل",
    "city_name_en": "Ezbet el Nakhl"
  },
  {
    "id": "20",
    "governorate_id": "1",
    "city_name_ar": "المطرية",
    "city_name_en": "Matareya"
  },
  {
    "id": "21",
    "governorate_id": "1",
    "city_name_ar": "المعادى",
    "city_name_en": "Maadi"
  },
  {
    "id": "22",
    "governorate_id": "1",
    "city_name_ar": "المعصرة",
    "city_name_en": "Maasara"
  },
  {
    "id": "23",
    "governorate_id": "1",
    "city_name_ar": "المقطم",
    "city_name_en": "Mokattam"
  },
  {
    "id": "24",
    "governorate_id": "1",
    "city_name_ar": "المنيل",
    "city_name_en": "Manyal"
  },
  {
    "id": "25",
    "governorate_id": "1",
    "city_name_ar": "الموسكى",
    "city_name_en": "Mosky"
  },
  {
    "id": "26",
    "governorate_id": "1",
    "city_name_ar": "النزهة",
    "city_name_en": "Nozha"
  },
  {
    "id": "27",
    "governorate_id": "1",
    "city_name_ar": "الوايلى",
    "city_name_en": "Waily"
  },
  {
    "id": "28",
    "governorate_id": "1",
    "city_name_ar": "باب الشعرية",
    "city_name_en": "Bab al-Shereia"
  },
  {
    "id": "29",
    "governorate_id": "1",
    "city_name_ar": "بولاق",
    "city_name_en": "Bolaq"
  },
  {
    "id": "30",
    "governorate_id": "1",
    "city_name_ar": "جاردن سيتى",
    "city_name_en": "Garden City"
  },
  {
    "id": "31",
    "governorate_id": "1",
    "city_name_ar": "حدائق القبة",
    "city_name_en": "Hadayek El-Kobba"
  },
  {
    "id": "32",
    "governorate_id": "1",
    "city_name_ar": "حلوان",
    "city_name_en": "Helwan"
  },
  {
    "id": "33",
    "governorate_id": "1",
    "city_name_ar": "دار السلام",
    "city_name_en": "Dar Al Salam"
  },
  {
    "id": "34",
    "governorate_id": "1",
    "city_name_ar": "شبرا",
    "city_name_en": "Shubra"
  },
  {
    "id": "35",
    "governorate_id": "1",
    "city_name_ar": "طره",
    "city_name_en": "Tura"
  },
  {
    "id": "36",
    "governorate_id": "1",
    "city_name_ar": "عابدين",
    "city_name_en": "Abdeen"
  },
  {
    "id": "37",
    "governorate_id": "1",
    "city_name_ar": "عباسية",
    "city_name_en": "Abaseya"
  },
  {
    "id": "38",
    "governorate_id": "1",
    "city_name_ar": "عين شمس",
    "city_name_en": "Ain Shams"
  },
  {
    "id": "39",
    "governorate_id": "1",
    "city_name_ar": "مدينة نصر",
    "city_name_en": "Nasr City"
  },
  {
    "id": "40",
    "governorate_id": "1",
    "city_name_ar": "مصر الجديدة",
    "city_name_en": "New Heliopolis"
  },
  {
    "id": "41",
    "governorate_id": "1",
    "city_name_ar": "مصر القديمة",
    "city_name_en": "Masr Al Qadima"
  },
  {
    "id": "42",
    "governorate_id": "1",
    "city_name_ar": "منشية ناصر",
    "city_name_en": "Mansheya Nasir"
  },
  {
    "id": "43",
    "governorate_id": "1",
    "city_name_ar": "مدينة بدر",
    "city_name_en": "Badr City"
  },
  {
    "id": "44",
    "governorate_id": "1",
    "city_name_ar": "مدينة العبور",
    "city_name_en": "Obour City"
  },
  {
    "id": "45",
    "governorate_id": "1",
    "city_name_ar": "وسط البلد",
    "city_name_en": "Cairo Downtown"
  },
  {
    "id": "46",
    "governorate_id": "1",
    "city_name_ar": "الزمالك",
    "city_name_en": "Zamalek"
  },
  {
    "id": "47",
    "governorate_id": "1",
    "city_name_ar": "قصر النيل",
    "city_name_en": "Kasr El Nile"
  },
  {
    "id": "48",
    "governorate_id": "1",
    "city_name_ar": "الرحاب",
    "city_name_en": "Rehab"
  },
  {
    "id": "49",
    "governorate_id": "1",
    "city_name_ar": "القطامية",
    "city_name_en": "Katameya"
  },
  {
    "id": "50",
    "governorate_id": "1",
    "city_name_ar": "مدينتي",
    "city_name_en": "Madinty"
  },
  {
    "id": "51",
    "governorate_id": "1",
    "city_name_ar": "روض الفرج",
    "city_name_en": "Rod Alfarag"
  },
  {
    "id": "52",
    "governorate_id": "1",
    "city_name_ar": "شيراتون",
    "city_name_en": "Sheraton"
  },
  {
    "id": "53",
    "governorate_id": "1",
    "city_name_ar": "الجمالية",
    "city_name_en": "El-Gamaleya"
  },
  {
    "id": "54",
    "governorate_id": "1",
    "city_name_ar": "العاشر من رمضان",
    "city_name_en": "10th of Ramadan City"
  },
  {
    "id": "55",
    "governorate_id": "1",
    "city_name_ar": "الحلمية",
    "city_name_en": "Helmeyat Alzaytoun"
  },
  {
    "id": "56",
    "governorate_id": "1",
    "city_name_ar": "النزهة الجديدة",
    "city_name_en": "New Nozha"
  },
  {
    "id": "57",
    "governorate_id": "1",
    "city_name_ar": "العاصمة الإدارية",
    "city_name_en": "Capital New"
  },
  {
    "id": "58",
    "governorate_id": "2",
    "city_name_ar": "الجيزة",
    "city_name_en": "Giza"
  },
  {
    "id": "59",
    "governorate_id": "2",
    "city_name_ar": "السادس من أكتوبر",
    "city_name_en": "Sixth of October"
  },
  {
    "id": "60",
    "governorate_id": "2",
    "city_name_ar": "الشيخ زايد",
    "city_name_en": "Cheikh Zayed"
  },
  {
    "id": "61",
    "governorate_id": "2",
    "city_name_ar": "الحوامدية",
    "city_name_en": "Hawamdiyah"
  },
  {
    "id": "62",
    "governorate_id": "2",
    "city_name_ar": "البدرشين",
    "city_name_en": "Al Badrasheen"
  },
  {
    "id": "63",
    "governorate_id": "2",
    "city_name_ar": "الصف",
    "city_name_en": "Saf"
  },
  {
    "id": "64",
    "governorate_id": "2",
    "city_name_ar": "أطفيح",
    "city_name_en": "Atfih"
  },
  {
    "id": "65",
    "governorate_id": "2",
    "city_name_ar": "العياط",
    "city_name_en": "Al Ayat"
  },
  {
    "id": "66",
    "governorate_id": "2",
    "city_name_ar": "الباويطي",
    "city_name_en": "Al-Bawaiti"
  },
  {
    "id": "67",
    "governorate_id": "2",
    "city_name_ar": "منشأة القناطر",
    "city_name_en": "ManshiyetAl Qanater"
  },
  {
    "id": "68",
    "governorate_id": "2",
    "city_name_ar": "أوسيم",
    "city_name_en": "Oaseem"
  },
  {
    "id": "69",
    "governorate_id": "2",
    "city_name_ar": "كرداسة",
    "city_name_en": "Kerdasa"
  },
  {
    "id": "70",
    "governorate_id": "2",
    "city_name_ar": "أبو النمرس",
    "city_name_en": "Abu Nomros"
  },
  {
    "id": "71",
    "governorate_id": "2",
    "city_name_ar": "كفر غطاطي",
    "city_name_en": "Kafr Ghati"
  },
  {
    "id": "72",
    "governorate_id": "2",
    "city_name_ar": "منشأة البكاري",
    "city_name_en": "Manshiyet Al Bakari"
  },
  {
    "id": "73",
    "governorate_id": "2",
    "city_name_ar": "الدقى",
    "city_name_en": "Dokki"
  },
  {
    "id": "74",
    "governorate_id": "2",
    "city_name_ar": "العجوزة",
    "city_name_en": "Agouza"
  },
  {
    "id": "75",
    "governorate_id": "2",
    "city_name_ar": "الهرم",
    "city_name_en": "Haram"
  },
  {
    "id": "76",
    "governorate_id": "2",
    "city_name_ar": "الوراق",
    "city_name_en": "Warraq"
  },
  {
    "id": "77",
    "governorate_id": "2",
    "city_name_ar": "امبابة",
    "city_name_en": "Imbaba"
  },
  {
    "id": "78",
    "governorate_id": "2",
    "city_name_ar": "بولاق الدكرور",
    "city_name_en": "Boulaq Dakrour"
  },
  {
    "id": "79",
    "governorate_id": "2",
    "city_name_ar": "الواحات البحرية",
    "city_name_en": "Al Wahat Al Baharia"
  },
  {
    "id": "80",
    "governorate_id": "2",
    "city_name_ar": "العمرانية",
    "city_name_en": "Omraneya"
  },
  {
    "id": "81",
    "governorate_id": "2",
    "city_name_ar": "المنيب",
    "city_name_en": "Moneeb"
  },
  {
    "id": "82",
    "governorate_id": "2",
    "city_name_ar": "بين السرايات",
    "city_name_en": "Bin Alsarayat"
  },
  {
    "id": "83",
    "governorate_id": "2",
    "city_name_ar": "الكيت كات",
    "city_name_en": "Kit Kat"
  },
  {
    "id": "84",
    "governorate_id": "2",
    "city_name_ar": "المهندسين",
    "city_name_en": "Mohandessin"
  },
  {
    "id": "85",
    "governorate_id": "2",
    "city_name_ar": "فيصل",
    "city_name_en": "Faisal"
  },
  {
    "id": "86",
    "governorate_id": "2",
    "city_name_ar": "أبو رواش",
    "city_name_en": "Abu Rawash"
  },
  {
    "id": "87",
    "governorate_id": "2",
    "city_name_ar": "حدائق الأهرام",
    "city_name_en": "Hadayek Alahram"
  },
  {
    "id": "88",
    "governorate_id": "2",
    "city_name_ar": "الحرانية",
    "city_name_en": "Haraneya"
  },
  {
    "id": "89",
    "governorate_id": "2",
    "city_name_ar": "حدائق اكتوبر",
    "city_name_en": "Hadayek October"
  },
  {
    "id": "90",
    "governorate_id": "2",
    "city_name_ar": "صفط اللبن",
    "city_name_en": "Saft Allaban"
  },
  {
    "id": "91",
    "governorate_id": "2",
    "city_name_ar": "القرية الذكية",
    "city_name_en": "Smart Village"
  },
  {
    "id": "92",
    "governorate_id": "2",
    "city_name_ar": "ارض اللواء",
    "city_name_en": "Ard Ellwaa"
  },
  {
    "id": "93",
    "governorate_id": "3",
    "city_name_ar": "ابو قير",
    "city_name_en": "Abu Qir"
  },
  {
    "id": "94",
    "governorate_id": "3",
    "city_name_ar": "الابراهيمية",
    "city_name_en": "Al Ibrahimeyah"
  },
  {
    "id": "95",
    "governorate_id": "3",
    "city_name_ar": "الأزاريطة",
    "city_name_en": "Azarita"
  },
  {
    "id": "96",
    "governorate_id": "3",
    "city_name_ar": "الانفوشى",
    "city_name_en": "Anfoushi"
  },
  {
    "id": "97",
    "governorate_id": "3",
    "city_name_ar": "الدخيلة",
    "city_name_en": "Dekheila"
  },
  {
    "id": "98",
    "governorate_id": "3",
    "city_name_ar": "السيوف",
    "city_name_en": "El Soyof"
  },
  {
    "id": "99",
    "governorate_id": "3",
    "city_name_ar": "العامرية",
    "city_name_en": "Ameria"
  },
  {
    "id": "100",
    "governorate_id": "3",
    "city_name_ar": "اللبان",
    "city_name_en": "El Labban"
  },
  {
    "id": "101",
    "governorate_id": "3",
    "city_name_ar": "المفروزة",
    "city_name_en": "Al Mafrouza"
  },
  {
    "id": "102",
    "governorate_id": "3",
    "city_name_ar": "المنتزه",
    "city_name_en": "El Montaza"
  },
  {
    "id": "103",
    "governorate_id": "3",
    "city_name_ar": "المنشية",
    "city_name_en": "Mansheya"
  },
  {
    "id": "104",
    "governorate_id": "3",
    "city_name_ar": "الناصرية",
    "city_name_en": "Naseria"
  },
  {
    "id": "105",
    "governorate_id": "3",
    "city_name_ar": "امبروزو",
    "city_name_en": "Ambrozo"
  },
  {
    "id": "106",
    "governorate_id": "3",
    "city_name_ar": "باب شرق",
    "city_name_en": "Bab Sharq"
  },
  {
    "id": "107",
    "governorate_id": "3",
    "city_name_ar": "برج العرب",
    "city_name_en": "Bourj Alarab"
  },
  {
    "id": "108",
    "governorate_id": "3",
    "city_name_ar": "ستانلى",
    "city_name_en": "Stanley"
  },
  {
    "id": "109",
    "governorate_id": "3",
    "city_name_ar": "سموحة",
    "city_name_en": "Smouha"
  },
  {
    "id": "110",
    "governorate_id": "3",
    "city_name_ar": "سيدى بشر",
    "city_name_en": "Sidi Bishr"
  },
  {
    "id": "111",
    "governorate_id": "3",
    "city_name_ar": "شدس",
    "city_name_en": "Shads"
  },
  {
    "id": "112",
    "governorate_id": "3",
    "city_name_ar": "غيط العنب",
    "city_name_en": "Gheet Alenab"
  },
  {
    "id": "113",
    "governorate_id": "3",
    "city_name_ar": "فلمينج",
    "city_name_en": "Fleming"
  },
  {
    "id": "114",
    "governorate_id": "3",
    "city_name_ar": "فيكتوريا",
    "city_name_en": "Victoria"
  },
  {
    "id": "115",
    "governorate_id": "3",
    "city_name_ar": "كامب شيزار",
    "city_name_en": "Camp Shizar"
  },
  {
    "id": "116",
    "governorate_id": "3",
    "city_name_ar": "كرموز",
    "city_name_en": "Karmooz"
  },
  {
    "id": "117",
    "governorate_id": "3",
    "city_name_ar": "محطة الرمل",
    "city_name_en": "Mahta Alraml"
  },
  {
    "id": "118",
    "governorate_id": "3",
    "city_name_ar": "مينا البصل",
    "city_name_en": "Mina El-Basal"
  },
  {
    "id": "119",
    "governorate_id": "3",
    "city_name_ar": "العصافرة",
    "city_name_en": "Asafra"
  },
  {
    "id": "120",
    "governorate_id": "3",
    "city_name_ar": "العجمي",
    "city_name_en": "Agamy"
  },
  {
    "id": "121",
    "governorate_id": "3",
    "city_name_ar": "بكوس",
    "city_name_en": "Bakos"
  },
  {
    "id": "122",
    "governorate_id": "3",
    "city_name_ar": "بولكلي",
    "city_name_en": "Boulkly"
  },
  {
    "id": "123",
    "governorate_id": "3",
    "city_name_ar": "كليوباترا",
    "city_name_en": "Cleopatra"
  },
  {
    "id": "124",
    "governorate_id": "3",
    "city_name_ar": "جليم",
    "city_name_en": "Glim"
  },
  {
    "id": "125",
    "governorate_id": "3",
    "city_name_ar": "المعمورة",
    "city_name_en": "Al Mamurah"
  },
  {
    "id": "126",
    "governorate_id": "3",
    "city_name_ar": "المندرة",
    "city_name_en": "Al Mandara"
  },
  {
    "id": "127",
    "governorate_id": "3",
    "city_name_ar": "محرم بك",
    "city_name_en": "Moharam Bek"
  },
  {
    "id": "128",
    "governorate_id": "3",
    "city_name_ar": "الشاطبي",
    "city_name_en": "Elshatby"
  },
  {
    "id": "129",
    "governorate_id": "3",
    "city_name_ar": "سيدي جابر",
    "city_name_en": "Sidi Gaber"
  },
  {
    "id": "130",
    "governorate_id": "3",
    "city_name_ar": "الساحل الشمالي",
    "city_name_en": "North Coast/sahel"
  },
  {
    "id": "131",
    "governorate_id": "3",
    "city_name_ar": "الحضرة",
    "city_name_en": "Alhadra"
  },
  {
    "id": "132",
    "governorate_id": "3",
    "city_name_ar": "العطارين",
    "city_name_en": "Alattarin"
  },
  {
    "id": "133",
    "governorate_id": "3",
    "city_name_ar": "سيدي كرير",
    "city_name_en": "Sidi Kerir"
  },
  {
    "id": "134",
    "governorate_id": "3",
    "city_name_ar": "الجمرك",
    "city_name_en": "Elgomrok"
  },
  {
    "id": "135",
    "governorate_id": "3",
    "city_name_ar": "المكس",
    "city_name_en": "Al Max"
  },
  {
    "id": "136",
    "governorate_id": "3",
    "city_name_ar": "مارينا",
    "city_name_en": "Marina"
  },
  {
    "id": "137",
    "governorate_id": "4",
    "city_name_ar": "المنصورة",
    "city_name_en": "Mansoura"
  },
  {
    "id": "138",
    "governorate_id": "4",
    "city_name_ar": "طلخا",
    "city_name_en": "Talkha"
  },
  {
    "id": "139",
    "governorate_id": "4",
    "city_name_ar": "ميت غمر",
    "city_name_en": "Mitt Ghamr"
  },
  {
    "id": "140",
    "governorate_id": "4",
    "city_name_ar": "دكرنس",
    "city_name_en": "Dekernes"
  },
  {
    "id": "141",
    "governorate_id": "4",
    "city_name_ar": "أجا",
    "city_name_en": "Aga"
  },
  {
    "id": "142",
    "governorate_id": "4",
    "city_name_ar": "منية النصر",
    "city_name_en": "Menia El Nasr"
  },
  {
    "id": "143",
    "governorate_id": "4",
    "city_name_ar": "السنبلاوين",
    "city_name_en": "Sinbillawin"
  },
  {
    "id": "144",
    "governorate_id": "4",
    "city_name_ar": "الكردي",
    "city_name_en": "El Kurdi"
  },
  {
    "id": "145",
    "governorate_id": "4",
    "city_name_ar": "بني عبيد",
    "city_name_en": "Bani Ubaid"
  },
  {
    "id": "146",
    "governorate_id": "4",
    "city_name_ar": "المنزلة",
    "city_name_en": "Al Manzala"
  },
  {
    "id": "147",
    "governorate_id": "4",
    "city_name_ar": "تمي الأمديد",
    "city_name_en": "tami al'amdid"
  },
  {
    "id": "148",
    "governorate_id": "4",
    "city_name_ar": "الجمالية",
    "city_name_en": "aljamalia"
  },
  {
    "id": "149",
    "governorate_id": "4",
    "city_name_ar": "شربين",
    "city_name_en": "Sherbin"
  },
  {
    "id": "150",
    "governorate_id": "4",
    "city_name_ar": "المطرية",
    "city_name_en": "Mataria"
  },
  {
    "id": "151",
    "governorate_id": "4",
    "city_name_ar": "بلقاس",
    "city_name_en": "Belqas"
  },
  {
    "id": "152",
    "governorate_id": "4",
    "city_name_ar": "ميت سلسيل",
    "city_name_en": "Meet Salsil"
  },
  {
    "id": "153",
    "governorate_id": "4",
    "city_name_ar": "جمصة",
    "city_name_en": "Gamasa"
  },
  {
    "id": "154",
    "governorate_id": "4",
    "city_name_ar": "محلة دمنة",
    "city_name_en": "Mahalat Damana"
  },
  {
    "id": "155",
    "governorate_id": "4",
    "city_name_ar": "نبروه",
    "city_name_en": "Nabroh"
  },
  {
    "id": "156",
    "governorate_id": "5",
    "city_name_ar": "الغردقة",
    "city_name_en": "Hurghada"
  },
  {
    "id": "157",
    "governorate_id": "5",
    "city_name_ar": "رأس غارب",
    "city_name_en": "Ras Ghareb"
  },
  {
    "id": "158",
    "governorate_id": "5",
    "city_name_ar": "سفاجا",
    "city_name_en": "Safaga"
  },
  {
    "id": "159",
    "governorate_id": "5",
    "city_name_ar": "القصير",
    "city_name_en": "El Qusiar"
  },
  {
    "id": "160",
    "governorate_id": "5",
    "city_name_ar": "مرسى علم",
    "city_name_en": "Marsa Alam"
  },
  {
    "id": "161",
    "governorate_id": "5",
    "city_name_ar": "الشلاتين",
    "city_name_en": "Shalatin"
  },
  {
    "id": "162",
    "governorate_id": "5",
    "city_name_ar": "حلايب",
    "city_name_en": "Halaib"
  },
  {
    "id": "163",
    "governorate_id": "5",
    "city_name_ar": "الدهار",
    "city_name_en": "Aldahar"
  },
  {
    "id": "164",
    "governorate_id": "6",
    "city_name_ar": "دمنهور",
    "city_name_en": "Damanhour"
  },
  {
    "id": "165",
    "governorate_id": "6",
    "city_name_ar": "كفر الدوار",
    "city_name_en": "Kafr El Dawar"
  },
  {
    "id": "166",
    "governorate_id": "6",
    "city_name_ar": "رشيد",
    "city_name_en": "Rashid"
  },
  {
    "id": "167",
    "governorate_id": "6",
    "city_name_ar": "إدكو",
    "city_name_en": "Edco"
  },
  {
    "id": "168",
    "governorate_id": "6",
    "city_name_ar": "أبو المطامير",
    "city_name_en": "Abu al-Matamir"
  },
  {
    "id": "169",
    "governorate_id": "6",
    "city_name_ar": "أبو حمص",
    "city_name_en": "Abu Homs"
  },
  {
    "id": "170",
    "governorate_id": "6",
    "city_name_ar": "الدلنجات",
    "city_name_en": "Delengat"
  },
  {
    "id": "171",
    "governorate_id": "6",
    "city_name_ar": "المحمودية",
    "city_name_en": "Mahmoudiyah"
  },
  {
    "id": "172",
    "governorate_id": "6",
    "city_name_ar": "الرحمانية",
    "city_name_en": "Rahmaniyah"
  },
  {
    "id": "173",
    "governorate_id": "6",
    "city_name_ar": "إيتاي البارود",
    "city_name_en": "Itai Baroud"
  },
  {
    "id": "174",
    "governorate_id": "6",
    "city_name_ar": "حوش عيسى",
    "city_name_en": "Housh Eissa"
  },
  {
    "id": "175",
    "governorate_id": "6",
    "city_name_ar": "شبراخيت",
    "city_name_en": "Shubrakhit"
  },
  {
    "id": "176",
    "governorate_id": "6",
    "city_name_ar": "كوم حمادة",
    "city_name_en": "Kom Hamada"
  },
  {
    "id": "177",
    "governorate_id": "6",
    "city_name_ar": "بدر",
    "city_name_en": "Badr"
  },
  {
    "id": "178",
    "governorate_id": "6",
    "city_name_ar": "وادي النطرون",
    "city_name_en": "Wadi Natrun"
  },
  {
    "id": "179",
    "governorate_id": "6",
    "city_name_ar": "النوبارية الجديدة",
    "city_name_en": "New Nubaria"
  },
  {
    "id": "180",
    "governorate_id": "6",
    "city_name_ar": "النوبارية",
    "city_name_en": "Alnoubareya"
  },
  {
    "id": "181",
    "governorate_id": "7",
    "city_name_ar": "الفيوم",
    "city_name_en": "Fayoum"
  },
  {
    "id": "182",
    "governorate_id": "7",
    "city_name_ar": "الفيوم الجديدة",
    "city_name_en": "Fayoum El Gedida"
  },
  {
    "id": "183",
    "governorate_id": "7",
    "city_name_ar": "طامية",
    "city_name_en": "Tamiya"
  },
  {
    "id": "184",
    "governorate_id": "7",
    "city_name_ar": "سنورس",
    "city_name_en": "Snores"
  },
  {
    "id": "185",
    "governorate_id": "7",
    "city_name_ar": "إطسا",
    "city_name_en": "Etsa"
  },
  {
    "id": "186",
    "governorate_id": "7",
    "city_name_ar": "إبشواي",
    "city_name_en": "Epschway"
  },
  {
    "id": "187",
    "governorate_id": "7",
    "city_name_ar": "يوسف الصديق",
    "city_name_en": "Yusuf El Sediaq"
  },
  {
    "id": "188",
    "governorate_id": "7",
    "city_name_ar": "الحادقة",
    "city_name_en": "Hadqa"
  },
  {
    "id": "189",
    "governorate_id": "7",
    "city_name_ar": "اطسا",
    "city_name_en": "Atsa"
  },
  {
    "id": "190",
    "governorate_id": "7",
    "city_name_ar": "الجامعة",
    "city_name_en": "Algamaa"
  },
  {
    "id": "191",
    "governorate_id": "7",
    "city_name_ar": "السيالة",
    "city_name_en": "Sayala"
  },
  {
    "id": "192",
    "governorate_id": "8",
    "city_name_ar": "طنطا",
    "city_name_en": "Tanta"
  },
  {
    "id": "193",
    "governorate_id": "8",
    "city_name_ar": "المحلة الكبرى",
    "city_name_en": "Al Mahalla Al Kobra"
  },
  {
    "id": "194",
    "governorate_id": "8",
    "city_name_ar": "كفر الزيات",
    "city_name_en": "Kafr El Zayat"
  },
  {
    "id": "195",
    "governorate_id": "8",
    "city_name_ar": "زفتى",
    "city_name_en": "Zefta"
  },
  {
    "id": "196",
    "governorate_id": "8",
    "city_name_ar": "السنطة",
    "city_name_en": "El Santa"
  },
  {
    "id": "197",
    "governorate_id": "8",
    "city_name_ar": "قطور",
    "city_name_en": "Qutour"
  },
  {
    "id": "198",
    "governorate_id": "8",
    "city_name_ar": "بسيون",
    "city_name_en": "Basion"
  },
  {
    "id": "199",
    "governorate_id": "8",
    "city_name_ar": "سمنود",
    "city_name_en": "Samannoud"
  },
  {
    "id": "200",
    "governorate_id": "9",
    "city_name_ar": "الإسماعيلية",
    "city_name_en": "Ismailia"
  },
  {
    "id": "201",
    "governorate_id": "9",
    "city_name_ar": "فايد",
    "city_name_en": "Fayed"
  },
  {
    "id": "202",
    "governorate_id": "9",
    "city_name_ar": "القنطرة شرق",
    "city_name_en": "Qantara Sharq"
  },
  {
    "id": "203",
    "governorate_id": "9",
    "city_name_ar": "القنطرة غرب",
    "city_name_en": "Qantara Gharb"
  },
  {
    "id": "204",
    "governorate_id": "9",
    "city_name_ar": "التل الكبير",
    "city_name_en": "El Tal El Kabier"
  },
  {
    "id": "205",
    "governorate_id": "9",
    "city_name_ar": "أبو صوير",
    "city_name_en": "Abu Sawir"
  },
  {
    "id": "206",
    "governorate_id": "9",
    "city_name_ar": "القصاصين الجديدة",
    "city_name_en": "Kasasien El Gedida"
  },
  {
    "id": "207",
    "governorate_id": "9",
    "city_name_ar": "نفيشة",
    "city_name_en": "Nefesha"
  },
  {
    "id": "208",
    "governorate_id": "9",
    "city_name_ar": "الشيخ زايد",
    "city_name_en": "Sheikh Zayed"
  },
  {
    "id": "209",
    "governorate_id": "10",
    "city_name_ar": "شبين الكوم",
    "city_name_en": "Shbeen El Koom"
  },
  {
    "id": "210",
    "governorate_id": "10",
    "city_name_ar": "مدينة السادات",
    "city_name_en": "Sadat City"
  },
  {
    "id": "211",
    "governorate_id": "10",
    "city_name_ar": "منوف",
    "city_name_en": "Menouf"
  },
  {
    "id": "212",
    "governorate_id": "10",
    "city_name_ar": "سرس الليان",
    "city_name_en": "Sars El-Layan"
  },
  {
    "id": "213",
    "governorate_id": "10",
    "city_name_ar": "أشمون",
    "city_name_en": "Ashmon"
  },
  {
    "id": "214",
    "governorate_id": "10",
    "city_name_ar": "الباجور",
    "city_name_en": "Al Bagor"
  },
  {
    "id": "215",
    "governorate_id": "10",
    "city_name_ar": "قويسنا",
    "city_name_en": "Quesna"
  },
  {
    "id": "216",
    "governorate_id": "10",
    "city_name_ar": "بركة السبع",
    "city_name_en": "Berkat El Saba"
  },
  {
    "id": "217",
    "governorate_id": "10",
    "city_name_ar": "تلا",
    "city_name_en": "Tala"
  },
  {
    "id": "218",
    "governorate_id": "10",
    "city_name_ar": "الشهداء",
    "city_name_en": "Al Shohada"
  },
  {
    "id": "219",
    "governorate_id": "11",
    "city_name_ar": "المنيا",
    "city_name_en": "Minya"
  },
  {
    "id": "220",
    "governorate_id": "11",
    "city_name_ar": "المنيا الجديدة",
    "city_name_en": "Minya El Gedida"
  },
  {
    "id": "221",
    "governorate_id": "11",
    "city_name_ar": "العدوة",
    "city_name_en": "El Adwa"
  },
  {
    "id": "222",
    "governorate_id": "11",
    "city_name_ar": "مغاغة",
    "city_name_en": "Magagha"
  },
  {
    "id": "223",
    "governorate_id": "11",
    "city_name_ar": "بني مزار",
    "city_name_en": "Bani Mazar"
  },
  {
    "id": "224",
    "governorate_id": "11",
    "city_name_ar": "مطاي",
    "city_name_en": "Mattay"
  },
  {
    "id": "225",
    "governorate_id": "11",
    "city_name_ar": "سمالوط",
    "city_name_en": "Samalut"
  },
  {
    "id": "226",
    "governorate_id": "11",
    "city_name_ar": "المدينة الفكرية",
    "city_name_en": "Madinat El Fekria"
  },
  {
    "id": "227",
    "governorate_id": "11",
    "city_name_ar": "ملوي",
    "city_name_en": "Meloy"
  },
  {
    "id": "228",
    "governorate_id": "11",
    "city_name_ar": "دير مواس",
    "city_name_en": "Deir Mawas"
  },
  {
    "id": "229",
    "governorate_id": "11",
    "city_name_ar": "ابو قرقاص",
    "city_name_en": "Abu Qurqas"
  },
  {
    "id": "230",
    "governorate_id": "11",
    "city_name_ar": "ارض سلطان",
    "city_name_en": "Ard Sultan"
  },
  {
    "id": "231",
    "governorate_id": "12",
    "city_name_ar": "بنها",
    "city_name_en": "Banha"
  },
  {
    "id": "232",
    "governorate_id": "12",
    "city_name_ar": "قليوب",
    "city_name_en": "Qalyub"
  },
  {
    "id": "233",
    "governorate_id": "12",
    "city_name_ar": "شبرا الخيمة",
    "city_name_en": "Shubra Al Khaimah"
  },
  {
    "id": "234",
    "governorate_id": "12",
    "city_name_ar": "القناطر الخيرية",
    "city_name_en": "Al Qanater Charity"
  },
  {
    "id": "235",
    "governorate_id": "12",
    "city_name_ar": "الخانكة",
    "city_name_en": "Khanka"
  },
  {
    "id": "236",
    "governorate_id": "12",
    "city_name_ar": "كفر شكر",
    "city_name_en": "Kafr Shukr"
  },
  {
    "id": "237",
    "governorate_id": "12",
    "city_name_ar": "طوخ",
    "city_name_en": "Tukh"
  },
  {
    "id": "238",
    "governorate_id": "12",
    "city_name_ar": "قها",
    "city_name_en": "Qaha"
  },
  {
    "id": "239",
    "governorate_id": "12",
    "city_name_ar": "العبور",
    "city_name_en": "Obour"
  },
  {
    "id": "240",
    "governorate_id": "12",
    "city_name_ar": "الخصوص",
    "city_name_en": "Khosous"
  },
  {
    "id": "241",
    "governorate_id": "12",
    "city_name_ar": "شبين القناطر",
    "city_name_en": "Shibin Al Qanater"
  },
  {
    "id": "242",
    "governorate_id": "12",
    "city_name_ar": "مسطرد",
    "city_name_en": "Mostorod"
  },
  {
    "id": "243",
    "governorate_id": "13",
    "city_name_ar": "الخارجة",
    "city_name_en": "El Kharga"
  },
  {
    "id": "244",
    "governorate_id": "13",
    "city_name_ar": "باريس",
    "city_name_en": "Paris"
  },
  {
    "id": "245",
    "governorate_id": "13",
    "city_name_ar": "موط",
    "city_name_en": "Mout"
  },
  {
    "id": "246",
    "governorate_id": "13",
    "city_name_ar": "الفرافرة",
    "city_name_en": "Farafra"
  },
  {
    "id": "247",
    "governorate_id": "13",
    "city_name_ar": "بلاط",
    "city_name_en": "Balat"
  },
  {
    "id": "248",
    "governorate_id": "13",
    "city_name_ar": "الداخلة",
    "city_name_en": "Dakhla"
  },
  {
    "id": "249",
    "governorate_id": "14",
    "city_name_ar": "السويس",
    "city_name_en": "Suez"
  },
  {
    "id": "250",
    "governorate_id": "14",
    "city_name_ar": "الجناين",
    "city_name_en": "Alganayen"
  },
  {
    "id": "251",
    "governorate_id": "14",
    "city_name_ar": "عتاقة",
    "city_name_en": "Ataqah"
  },
  {
    "id": "252",
    "governorate_id": "14",
    "city_name_ar": "العين السخنة",
    "city_name_en": "Ain Sokhna"
  },
  {
    "id": "253",
    "governorate_id": "14",
    "city_name_ar": "فيصل",
    "city_name_en": "Faysal"
  },
  {
    "id": "254",
    "governorate_id": "15",
    "city_name_ar": "أسوان",
    "city_name_en": "Aswan"
  },
  {
    "id": "255",
    "governorate_id": "15",
    "city_name_ar": "أسوان الجديدة",
    "city_name_en": "Aswan El Gedida"
  },
  {
    "id": "256",
    "governorate_id": "15",
    "city_name_ar": "دراو",
    "city_name_en": "Drau"
  },
  {
    "id": "257",
    "governorate_id": "15",
    "city_name_ar": "كوم أمبو",
    "city_name_en": "Kom Ombo"
  },
  {
    "id": "258",
    "governorate_id": "15",
    "city_name_ar": "نصر النوبة",
    "city_name_en": "Nasr Al Nuba"
  },
  {
    "id": "259",
    "governorate_id": "15",
    "city_name_ar": "كلابشة",
    "city_name_en": "Kalabsha"
  },
  {
    "id": "260",
    "governorate_id": "15",
    "city_name_ar": "إدفو",
    "city_name_en": "Edfu"
  },
  {
    "id": "261",
    "governorate_id": "15",
    "city_name_ar": "الرديسية",
    "city_name_en": "Al-Radisiyah"
  },
  {
    "id": "262",
    "governorate_id": "15",
    "city_name_ar": "البصيلية",
    "city_name_en": "Al Basilia"
  },
  {
    "id": "263",
    "governorate_id": "15",
    "city_name_ar": "السباعية",
    "city_name_en": "Al Sibaeia"
  },
  {
    "id": "264",
    "governorate_id": "15",
    "city_name_ar": "ابوسمبل السياحية",
    "city_name_en": "Abo Simbl Al Siyahia"
  },
  {
    "id": "265",
    "governorate_id": "15",
    "city_name_ar": "مرسى علم",
    "city_name_en": "Marsa Alam"
  },
  {
    "id": "266",
    "governorate_id": "16",
    "city_name_ar": "أسيوط",
    "city_name_en": "Assiut"
  },
  {
    "id": "267",
    "governorate_id": "16",
    "city_name_ar": "أسيوط الجديدة",
    "city_name_en": "Assiut El Gedida"
  },
  {
    "id": "268",
    "governorate_id": "16",
    "city_name_ar": "ديروط",
    "city_name_en": "Dayrout"
  },
  {
    "id": "269",
    "governorate_id": "16",
    "city_name_ar": "منفلوط",
    "city_name_en": "Manfalut"
  },
  {
    "id": "270",
    "governorate_id": "16",
    "city_name_ar": "القوصية",
    "city_name_en": "Qusiya"
  },
  {
    "id": "271",
    "governorate_id": "16",
    "city_name_ar": "أبنوب",
    "city_name_en": "Abnoub"
  },
  {
    "id": "272",
    "governorate_id": "16",
    "city_name_ar": "أبو تيج",
    "city_name_en": "Abu Tig"
  },
  {
    "id": "273",
    "governorate_id": "16",
    "city_name_ar": "الغنايم",
    "city_name_en": "El Ghanaim"
  },
  {
    "id": "274",
    "governorate_id": "16",
    "city_name_ar": "ساحل سليم",
    "city_name_en": "Sahel Selim"
  },
  {
    "id": "275",
    "governorate_id": "16",
    "city_name_ar": "البداري",
    "city_name_en": "El Badari"
  },
  {
    "id": "276",
    "governorate_id": "16",
    "city_name_ar": "صدفا",
    "city_name_en": "Sidfa"
  },
  {
    "id": "277",
    "governorate_id": "17",
    "city_name_ar": "بني سويف",
    "city_name_en": "Bani Sweif"
  },
  {
    "id": "278",
    "governorate_id": "17",
    "city_name_ar": "بني سويف الجديدة",
    "city_name_en": "Beni Suef El Gedida"
  },
  {
    "id": "279",
    "governorate_id": "17",
    "city_name_ar": "الواسطى",
    "city_name_en": "Al Wasta"
  },
  {
    "id": "280",
    "governorate_id": "17",
    "city_name_ar": "ناصر",
    "city_name_en": "Naser"
  },
  {
    "id": "281",
    "governorate_id": "17",
    "city_name_ar": "إهناسيا",
    "city_name_en": "Ehnasia"
  },
  {
    "id": "282",
    "governorate_id": "17",
    "city_name_ar": "ببا",
    "city_name_en": "beba"
  },
  {
    "id": "283",
    "governorate_id": "17",
    "city_name_ar": "الفشن",
    "city_name_en": "Fashn"
  },
  {
    "id": "284",
    "governorate_id": "17",
    "city_name_ar": "سمسطا",
    "city_name_en": "Somasta"
  },
  {
    "id": "285",
    "governorate_id": "17",
    "city_name_ar": "الاباصيرى",
    "city_name_en": "Alabbaseri"
  },
  {
    "id": "286",
    "governorate_id": "17",
    "city_name_ar": "مقبل",
    "city_name_en": "Mokbel"
  },
  {
    "id": "287",
    "governorate_id": "18",
    "city_name_ar": "بورسعيد",
    "city_name_en": "PorSaid"
  },
  {
    "id": "288",
    "governorate_id": "18",
    "city_name_ar": "بورفؤاد",
    "city_name_en": "Port Fouad"
  },
  {
    "id": "289",
    "governorate_id": "18",
    "city_name_ar": "العرب",
    "city_name_en": "Alarab"
  },
  {
    "id": "290",
    "governorate_id": "18",
    "city_name_ar": "حى الزهور",
    "city_name_en": "Zohour"
  },
  {
    "id": "291",
    "governorate_id": "18",
    "city_name_ar": "حى الشرق",
    "city_name_en": "Alsharq"
  },
  {
    "id": "292",
    "governorate_id": "18",
    "city_name_ar": "حى الضواحى",
    "city_name_en": "Aldawahi"
  },
  {
    "id": "293",
    "governorate_id": "18",
    "city_name_ar": "حى المناخ",
    "city_name_en": "Almanakh"
  },
  {
    "id": "294",
    "governorate_id": "18",
    "city_name_ar": "حى مبارك",
    "city_name_en": "Mubarak"
  },
  {
    "id": "295",
    "governorate_id": "19",
    "city_name_ar": "دمياط",
    "city_name_en": "Damietta"
  },
  {
    "id": "296",
    "governorate_id": "19",
    "city_name_ar": "دمياط الجديدة",
    "city_name_en": "New Damietta"
  },
  {
    "id": "297",
    "governorate_id": "19",
    "city_name_ar": "رأس البر",
    "city_name_en": "Ras El Bar"
  },
  {
    "id": "298",
    "governorate_id": "19",
    "city_name_ar": "فارسكور",
    "city_name_en": "Faraskour"
  },
  {
    "id": "299",
    "governorate_id": "19",
    "city_name_ar": "الزرقا",
    "city_name_en": "Zarqa"
  },
  {
    "id": "300",
    "governorate_id": "19",
    "city_name_ar": "السرو",
    "city_name_en": "alsaru"
  },
  {
    "id": "301",
    "governorate_id": "19",
    "city_name_ar": "الروضة",
    "city_name_en": "alruwda"
  },
  {
    "id": "302",
    "governorate_id": "19",
    "city_name_ar": "كفر البطيخ",
    "city_name_en": "Kafr El-Batikh"
  },
  {
    "id": "303",
    "governorate_id": "19",
    "city_name_ar": "عزبة البرج",
    "city_name_en": "Azbet Al Burg"
  },
  {
    "id": "304",
    "governorate_id": "19",
    "city_name_ar": "ميت أبو غالب",
    "city_name_en": "Meet Abou Ghalib"
  },
  {
    "id": "305",
    "governorate_id": "19",
    "city_name_ar": "كفر سعد",
    "city_name_en": "Kafr Saad"
  },
  {
    "id": "306",
    "governorate_id": "20",
    "city_name_ar": "الزقازيق",
    "city_name_en": "Zagazig"
  },
  {
    "id": "307",
    "governorate_id": "20",
    "city_name_ar": "العاشر من رمضان",
    "city_name_en": "Al Ashr Men Ramadan"
  },
  {
    "id": "308",
    "governorate_id": "20",
    "city_name_ar": "منيا القمح",
    "city_name_en": "Minya Al Qamh"
  },
  {
    "id": "309",
    "governorate_id": "20",
    "city_name_ar": "بلبيس",
    "city_name_en": "Belbeis"
  },
  {
    "id": "310",
    "governorate_id": "20",
    "city_name_ar": "مشتول السوق",
    "city_name_en": "Mashtoul El Souq"
  },
  {
    "id": "311",
    "governorate_id": "20",
    "city_name_ar": "القنايات",
    "city_name_en": "Qenaiat"
  },
  {
    "id": "312",
    "governorate_id": "20",
    "city_name_ar": "أبو حماد",
    "city_name_en": "Abu Hammad"
  },
  {
    "id": "313",
    "governorate_id": "20",
    "city_name_ar": "القرين",
    "city_name_en": "El Qurain"
  },
  {
    "id": "314",
    "governorate_id": "20",
    "city_name_ar": "ههيا",
    "city_name_en": "Hehia"
  },
  {
    "id": "315",
    "governorate_id": "20",
    "city_name_ar": "أبو كبير",
    "city_name_en": "Abu Kabir"
  },
  {
    "id": "316",
    "governorate_id": "20",
    "city_name_ar": "فاقوس",
    "city_name_en": "Faccus"
  },
  {
    "id": "317",
    "governorate_id": "20",
    "city_name_ar": "الصالحية الجديدة",
    "city_name_en": "El Salihia El Gedida"
  },
  {
    "id": "318",
    "governorate_id": "20",
    "city_name_ar": "الإبراهيمية",
    "city_name_en": "Al Ibrahimiyah"
  },
  {
    "id": "319",
    "governorate_id": "20",
    "city_name_ar": "ديرب نجم",
    "city_name_en": "Deirb Negm"
  },
  {
    "id": "320",
    "governorate_id": "20",
    "city_name_ar": "كفر صقر",
    "city_name_en": "Kafr Saqr"
  },
  {
    "id": "321",
    "governorate_id": "20",
    "city_name_ar": "أولاد صقر",
    "city_name_en": "Awlad Saqr"
  },
  {
    "id": "322",
    "governorate_id": "20",
    "city_name_ar": "الحسينية",
    "city_name_en": "Husseiniya"
  },
  {
    "id": "323",
    "governorate_id": "20",
    "city_name_ar": "صان الحجر القبلية",
    "city_name_en": "san alhajar alqablia"
  },
  {
    "id": "324",
    "governorate_id": "20",
    "city_name_ar": "منشأة أبو عمر",
    "city_name_en": "Manshayat Abu Omar"
  },
  {
    "id": "325",
    "governorate_id": "21",
    "city_name_ar": "الطور",
    "city_name_en": "Al Toor"
  },
  {
    "id": "326",
    "governorate_id": "21",
    "city_name_ar": "شرم الشيخ",
    "city_name_en": "Sharm El-Shaikh"
  },
  {
    "id": "327",
    "governorate_id": "21",
    "city_name_ar": "دهب",
    "city_name_en": "Dahab"
  },
  {
    "id": "328",
    "governorate_id": "21",
    "city_name_ar": "نويبع",
    "city_name_en": "Nuweiba"
  },
  {
    "id": "329",
    "governorate_id": "21",
    "city_name_ar": "طابا",
    "city_name_en": "Taba"
  },
  {
    "id": "330",
    "governorate_id": "21",
    "city_name_ar": "سانت كاترين",
    "city_name_en": "Saint Catherine"
  },
  {
    "id": "331",
    "governorate_id": "21",
    "city_name_ar": "أبو رديس",
    "city_name_en": "Abu Redis"
  },
  {
    "id": "332",
    "governorate_id": "21",
    "city_name_ar": "أبو زنيمة",
    "city_name_en": "Abu Zenaima"
  },
  {
    "id": "333",
    "governorate_id": "21",
    "city_name_ar": "رأس سدر",
    "city_name_en": "Ras Sidr"
  },
  {
    "id": "334",
    "governorate_id": "22",
    "city_name_ar": "كفر الشيخ",
    "city_name_en": "Kafr El Sheikh"
  },
  {
    "id": "335",
    "governorate_id": "22",
    "city_name_ar": "وسط البلد كفر الشيخ",
    "city_name_en": "Kafr El Sheikh Downtown"
  },
  {
    "id": "336",
    "governorate_id": "22",
    "city_name_ar": "دسوق",
    "city_name_en": "Desouq"
  },
  {
    "id": "337",
    "governorate_id": "22",
    "city_name_ar": "فوه",
    "city_name_en": "Fooh"
  },
  {
    "id": "338",
    "governorate_id": "22",
    "city_name_ar": "مطوبس",
    "city_name_en": "Metobas"
  },
  {
    "id": "339",
    "governorate_id": "22",
    "city_name_ar": "برج البرلس",
    "city_name_en": "Burg Al Burullus"
  },
  {
    "id": "340",
    "governorate_id": "22",
    "city_name_ar": "بلطيم",
    "city_name_en": "Baltim"
  },
  {
    "id": "341",
    "governorate_id": "22",
    "city_name_ar": "مصيف بلطيم",
    "city_name_en": "Masief Baltim"
  },
  {
    "id": "342",
    "governorate_id": "22",
    "city_name_ar": "الحامول",
    "city_name_en": "Hamol"
  },
  {
    "id": "343",
    "governorate_id": "22",
    "city_name_ar": "بيلا",
    "city_name_en": "Bella"
  },
  {
    "id": "344",
    "governorate_id": "22",
    "city_name_ar": "الرياض",
    "city_name_en": "Riyadh"
  },
  {
    "id": "345",
    "governorate_id": "22",
    "city_name_ar": "سيدي سالم",
    "city_name_en": "Sidi Salm"
  },
  {
    "id": "346",
    "governorate_id": "22",
    "city_name_ar": "قلين",
    "city_name_en": "Qellen"
  },
  {
    "id": "347",
    "governorate_id": "22",
    "city_name_ar": "سيدي غازي",
    "city_name_en": "Sidi Ghazi"
  },
  {
    "id": "348",
    "governorate_id": "23",
    "city_name_ar": "مرسى مطروح",
    "city_name_en": "Marsa Matrouh"
  },
  {
    "id": "349",
    "governorate_id": "23",
    "city_name_ar": "الحمام",
    "city_name_en": "El Hamam"
  },
  {
    "id": "350",
    "governorate_id": "23",
    "city_name_ar": "العلمين",
    "city_name_en": "Alamein"
  },
  {
    "id": "351",
    "governorate_id": "23",
    "city_name_ar": "الضبعة",
    "city_name_en": "Dabaa"
  },
  {
    "id": "352",
    "governorate_id": "23",
    "city_name_ar": "النجيلة",
    "city_name_en": "Al-Nagila"
  },
  {
    "id": "353",
    "governorate_id": "23",
    "city_name_ar": "سيدي براني",
    "city_name_en": "Sidi Brani"
  },
  {
    "id": "354",
    "governorate_id": "23",
    "city_name_ar": "السلوم",
    "city_name_en": "Salloum"
  },
  {
    "id": "355",
    "governorate_id": "23",
    "city_name_ar": "سيوة",
    "city_name_en": "Siwa"
  },
  {
    "id": "356",
    "governorate_id": "23",
    "city_name_ar": "مارينا",
    "city_name_en": "Marina"
  },
  {
    "id": "357",
    "governorate_id": "23",
    "city_name_ar": "الساحل الشمالى",
    "city_name_en": "North Coast"
  },
  {
    "id": "358",
    "governorate_id": "24",
    "city_name_ar": "الأقصر",
    "city_name_en": "Luxor"
  },
  {
    "id": "359",
    "governorate_id": "24",
    "city_name_ar": "الأقصر الجديدة",
    "city_name_en": "New Luxor"
  },
  {
    "id": "360",
    "governorate_id": "24",
    "city_name_ar": "إسنا",
    "city_name_en": "Esna"
  },
  {
    "id": "361",
    "governorate_id": "24",
    "city_name_ar": "طيبة الجديدة",
    "city_name_en": "New Tiba"
  },
  {
    "id": "362",
    "governorate_id": "24",
    "city_name_ar": "الزينية",
    "city_name_en": "Al ziynia"
  },
  {
    "id": "363",
    "governorate_id": "24",
    "city_name_ar": "البياضية",
    "city_name_en": "Al Bayadieh"
  },
  {
    "id": "364",
    "governorate_id": "24",
    "city_name_ar": "القرنة",
    "city_name_en": "Al Qarna"
  },
  {
    "id": "365",
    "governorate_id": "24",
    "city_name_ar": "أرمنت",
    "city_name_en": "Armant"
  },
  {
    "id": "366",
    "governorate_id": "24",
    "city_name_ar": "الطود",
    "city_name_en": "Al Tud"
  },
  {
    "id": "367",
    "governorate_id": "25",
    "city_name_ar": "قنا",
    "city_name_en": "Qena"
  },
  {
    "id": "368",
    "governorate_id": "25",
    "city_name_ar": "قنا الجديدة",
    "city_name_en": "New Qena"
  },
  {
    "id": "369",
    "governorate_id": "25",
    "city_name_ar": "ابو طشت",
    "city_name_en": "Abu Tesht"
  },
  {
    "id": "370",
    "governorate_id": "25",
    "city_name_ar": "نجع حمادي",
    "city_name_en": "Nag Hammadi"
  },
  {
    "id": "371",
    "governorate_id": "25",
    "city_name_ar": "دشنا",
    "city_name_en": "Deshna"
  },
  {
    "id": "372",
    "governorate_id": "25",
    "city_name_ar": "الوقف",
    "city_name_en": "Alwaqf"
  },
  {
    "id": "373",
    "governorate_id": "25",
    "city_name_ar": "قفط",
    "city_name_en": "Qaft"
  },
  {
    "id": "374",
    "governorate_id": "25",
    "city_name_ar": "نقادة",
    "city_name_en": "Naqada"
  },
  {
    "id": "375",
    "governorate_id": "25",
    "city_name_ar": "فرشوط",
    "city_name_en": "Farshout"
  },
  {
    "id": "376",
    "governorate_id": "25",
    "city_name_ar": "قوص",
    "city_name_en": "Quos"
  },
  {
    "id": "377",
    "governorate_id": "26",
    "city_name_ar": "العريش",
    "city_name_en": "Arish"
  },
  {
    "id": "378",
    "governorate_id": "26",
    "city_name_ar": "الشيخ زويد",
    "city_name_en": "Sheikh Zowaid"
  },
  {
    "id": "379",
    "governorate_id": "26",
    "city_name_ar": "نخل",
    "city_name_en": "Nakhl"
  },
  {
    "id": "380",
    "governorate_id": "26",
    "city_name_ar": "رفح",
    "city_name_en": "Rafah"
  },
  {
    "id": "381",
    "governorate_id": "26",
    "city_name_ar": "بئر العبد",
    "city_name_en": "Bir al-Abed"
  },
  {
    "id": "382",
    "governorate_id": "26",
    "city_name_ar": "الحسنة",
    "city_name_en": "Al Hasana"
  },
  {
    "id": "383",
    "governorate_id": "27",
    "city_name_ar": "سوهاج",
    "city_name_en": "Sohag"
  },
  {
    "id": "384",
    "governorate_id": "27",
    "city_name_ar": "سوهاج الجديدة",
    "city_name_en": "Sohag El Gedida"
  },
  {
    "id": "385",
    "governorate_id": "27",
    "city_name_ar": "أخميم",
    "city_name_en": "Akhmeem"
  },
  {
    "id": "386",
    "governorate_id": "27",
    "city_name_ar": "أخميم الجديدة",
    "city_name_en": "Akhmim El Gedida"
  },
  {
    "id": "387",
    "governorate_id": "27",
    "city_name_ar": "البلينا",
    "city_name_en": "Albalina"
  },
  {
    "id": "388",
    "governorate_id": "27",
    "city_name_ar": "المراغة",
    "city_name_en": "El Maragha"
  },
  {
    "id": "389",
    "governorate_id": "27",
    "city_name_ar": "المنشأة",
    "city_name_en": "almunsha'a"
  },
  {
    "id": "390",
    "governorate_id": "27",
    "city_name_ar": "دار السلام",
    "city_name_en": "Dar AISalaam"
  },
  {
    "id": "391",
    "governorate_id": "27",
    "city_name_ar": "جرجا",
    "city_name_en": "Gerga"
  },
  {
    "id": "392",
    "governorate_id": "27",
    "city_name_ar": "جهينة الغربية",
    "city_name_en": "Jahina Al Gharbia"
  },
  {
    "id": "393",
    "governorate_id": "27",
    "city_name_ar": "ساقلته",
    "city_name_en": "Saqilatuh"
  },
  {
    "id": "394",
    "governorate_id": "27",
    "city_name_ar": "طما",
    "city_name_en": "Tama"
  },
  {
    "id": "395",
    "governorate_id": "27",
    "city_name_ar": "طهطا",
    "city_name_en": "Tahta"
  },
  {
    "id": "396",
    "governorate_id": "27",
    "city_name_ar": "الكوثر",
    "city_name_en": "Alkawthar"
  }
];
