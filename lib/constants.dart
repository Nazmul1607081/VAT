import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

const backgroundimage = AssetImage("images/backlaw.jpg");
bool netasekina = false;

class LawItemSearch {
  final no;
  final title;

  LawItemSearch(this.no, this.title);
}

class BdItemSearch {
  final no;
  final title;

  BdItemSearch(this.no, this.title);
}

List<LawItemSearch> lawList = [
  LawItemSearch("১", "সংক্ষিপ্ত শিরোনাম ও প্রবর্তন"),
  LawItemSearch("২", "সংজ্ঞা"),
  LawItemSearch("৩", "আইনের প্রাধান্য "),
  LawItemSearch("৪", "মূসক নিবন্ধনযোগ্য ব্যক্তি"),
  LawItemSearch("৫", "কেন্দ্রীয় বা শাখা ইউনিটের নিবন্ধন"),
  LawItemSearch("৬", "মূসক নিবন্ধন"),
  LawItemSearch("৭", "নিবন্ধিত ব্যক্তিবর্গের তালিকা প্রকাশ ও সংরক্ষণ"),
  LawItemSearch("৮", "স্বেচ্ছা মূসক নিবন্ধন"),
  LawItemSearch("৯", "স্বেচ্ছা মূসক নিবন্ধন"),
  LawItemSearch("১০", "তালিকাভুক্তিযোগ্য ব্যক্তি ও তালিকাভুক্তি"),
  LawItemSearch("১১", "তালিকাভুক্তি বাতিল"),
  LawItemSearch("১২",
      'স্ব-উদ্যোগে নিবন্ধনযোগ্য ও তালিকাভুক্তিযোগ্য ব্যক্তিকে নিবন্ধন বা তালিকাভুক্তিকরণ'),
  LawItemSearch(
      "১৩", "সনদপত্র প্রদর্শনে নিবন্ধিত বা তালিকাভুক্ত ব্যক্তির দায়িত্ব"),
  LawItemSearch("১৪",
      "পরিবর্তিত তথ্য অবহিতকরণে নিবন্ধিত বা তালিকাভু্কত ব্যক্তির দায়িত্ব"),

  ///musok arop
  LawItemSearch("১৫", "মূসক আরোপ"),
  LawItemSearch("১৬", "মূল্য সংযোজন কর পরিশোধে দায়ী ব্যক্তি"),
  LawItemSearch("১৭", "বাংলাদেশে প্রদত্ত সরবরাহ"),
  LawItemSearch("১৮", "নিবন্ধিত সরবরাহকারী এবং সরবরাহগ্রহীতা"),
  LawItemSearch("১৯", "অনাবাসিক ব্যক্তির মূসক এজেন্ট"),
  LawItemSearch("২০", "আমদানিকৃত সেবার ক্ষেত্রে গ্রহীতার নিকট হইতে কর আদায়"),
  LawItemSearch("২১", "শূন্যহার বিশিষ্ট সরবরাহ"),
  LawItemSearch("২২", "বাংলাদেশের বাহিরে অবস্থিত ভূমি"),
  LawItemSearch("২৩", "রপ্তানির নিমিত্ত পণ্য সরবরাহ"),
  LawItemSearch("২৪", "শূন্যহার বিশিষ্ট সেবা সরবরাহ"),
  LawItemSearch("২৫", "ট্রাভেল এজেন্ট এন্ড ট্যুর অপারেটর"),
  LawItemSearch("২৬", "অব্যাহতিপ্রাপ্ত সরবরাহ বা অব্যাহতিপ্রাপ্ত আমদানি"),
  LawItemSearch("২৭", "করযোগ্য আমদানির উপর মূসক আদায় পদ্ধতি"),
  LawItemSearch("২৮", "করযোগ্য আমদানির মূল্য নির্ধারণ "),
  LawItemSearch("২৯", "পুনঃআমদানিকৃত পণ্যের মূল্য নির্ধারণ"),
  LawItemSearch("৩০", "রপ্তানির নিমিত্ত আমদানি"),
  LawItemSearch("৩১", "আমদানিকালে আগাম কর পরিশোধ ও সমন্বয়"),
  LawItemSearch("৩২", "করযোগ্য সরবরাহের মূল্য নির্ধারণ"),
  LawItemSearch("৩২ক", "বোর্ড কর্তৃক ব্যাখ্যা প্রদান"),
  LawItemSearch("৩৩", "করযোগ্য সরবরাহের উপর মূসক প্রদানকাল"),
  LawItemSearch("৩৪", "আনুক্রমিক বা পর্যাবৃত্ত সরবরাহ"),
  LawItemSearch("৩৫", "একক ও বহুবিধ সরবরাহ"),
  LawItemSearch("৩৬", "চলমান ব্যবসা হিসাবে প্রতিষ্ঠান বিক্রয়"),
  LawItemSearch("৩৭", "অধিকার"),
  LawItemSearch("৩৮", "আগাম মূল্য পরিশোধিত টেলিযোগাযোগ দ্রব্য ও সেবা সরবরাহ"),
  LawItemSearch("৩৯", "লটারী, লাকি ড্র, হাউজি, র‌্যাফেল ড্র এবং অনুরূপ উদ্যোগ"),
  LawItemSearch("৪০",
      "কর্মচারী বা কর্মকর্তাকে নগদ অর্থের পরির্তে দ্রব্যের মাধ্যমে প্রদত্ত সুবিধার মূল্য"),
  LawItemSearch("৪১",
      "কর্মচারী বা কর্মকর্তাকে নগদ অর্থের পরির্তে দ্রব্যের মাধ্যমে প্রদত্ত সুবিধার মূল্য"),
  LawItemSearch("৪২", "বাতিলকৃত লেনদেন"),
  LawItemSearch("৪৩", "ঋণ পরিশোধে সম্পত্তি বিক্রয়"),
  LawItemSearch("৪৪", "বিক্রয় যন্ত্র"),
  LawItemSearch("৪৫", "সরবরাহের উপর প্রদেয় নীট কর নিরূপন ও পরিশোধ পদ্ধতি"),
  LawItemSearch("৪৬", "উপকরণ কর রেয়াত"),
  LawItemSearch("৪৭", "আংশিক উপকরণ কর রেয়াত"),
  LawItemSearch("৪৮", "সমন্বয়"),
  LawItemSearch(
      "৪৯", "উৎসে কর কর্তনকারী সত্তা কর্তৃক উৎসে কর কর্তন ও বৃদ্ধিকারী সমন্বয়"),
  LawItemSearch("৫০", "উৎসে কর কর্তনের পর সরবরাহকারী কর্তৃক হ্রাসকারী সমন্বয়"),
  LawItemSearch("৫১", "কর চালানপত্র"),
  LawItemSearch("৫২", "ক্রেডিট নোট এবং ডেবিট নোট"),
  LawItemSearch("৫৩", "সমন্বিত কর চালানপত্র এবং উৎসে কর কর্তন সনদপত্র"),
  LawItemSearch("৫৪", "কর দলিলাদি সংক্রান্ত অন্যান্য বিধান"),
  LawItemSearch("৫৫", "সম্পূরক শুল্ক আরোপ"),
  LawItemSearch("৫৬", "সম্পূরক শুল্ক পরিশোধে দায়ী ব্যক্তি"),
  LawItemSearch("৫৭", "সম্পূরক শুল্ক আরোপযোগ্য মূল্য"),
  LawItemSearch("৫৮", "তামাক এবং এলকোহলযু্ক্ত পণ্যের ক্ষেত্রে বিশেষ পরিকল্প"),
  LawItemSearch("৫৯", "আমদানির উপর সম্পূরক শুল্ক আদায়"),
  LawItemSearch("৬০", "সরবরাহের উপর সম্পূরক শুল্ক আদায়"),
  LawItemSearch("৬১", "সম্পূরক শুল্ক আদায়যোগ্য পণ্যের অনুমিত সরবরাহ"),
  LawItemSearch("৬২", "সম্পূরক শুল্কের নিমিত্ত হ্রাসকারী সমন্বয়"),
  LawItemSearch("৬৩", "টার্ণওভার কর আরোপ ও আদায়"),
  LawItemSearch("৬৪", "দাখিলপত্র পেশ"),
  LawItemSearch("৬৫", "বিলম্বে দাখিলপত্র পেশ"),
  LawItemSearch("৬৬", "দাখিলপত্রে সংশোধন"),
  LawItemSearch("৬৭", "পূর্ণ, অতিরিক্ত বা বিকল্প দাখিলপত্র পেশ"),
  LawItemSearch("৬৮", "ঋণাত্মক নীট অর্থ জের টানা ও ফেরত প্রদান"),
  LawItemSearch("৬৯", "ঋণাত্মক নীট অর্থ জের টানা ব্যতিরেকে ফেরত প্রদান"),
  LawItemSearch("৭০", "ফেরত প্রদত্ত অর্থের প্রয়োগ"),
  LawItemSearch("৭১",
      "কূটনৈতিক এবং অন্যান্য আন্তর্জাতিক সংস্থা কর্তৃক প্রদত্ত কর ফেরত প্রদান"),
  LawItemSearch("৭২", "অতিরিক্ত পরিশোধিত কর সমন্বয় বা ফেরত প্রদান"),
  LawItemSearch("৭৩", "কর নির্ধারণ"),
  LawItemSearch("৭৪", "সরবরাহ গ্রহীতার মিথ্যা ঘোষণা"),
  LawItemSearch("৭৫", "সরবরাহকারীর মিথ্যা বর্ণনা"),
  LawItemSearch("৭৬", "কর সুবিধা প্রদান ও রদকরণ"),
  LawItemSearch("৭৭", "কর নির্ধারণী নোটিশের গ্রহণযোগ্যতা"),
  LawItemSearch("৭৮", "মূল্য সংযোজন কর কর্তৃপক্ষ এবং উহার কর্মকর্তা"),
  LawItemSearch("৭৯", "মূসক কর্তৃপক্ষের দায়িত্ব এবং কর্তব্য"),
  LawItemSearch(
      "৮০", "মূসক কর্মকর্তার আদেশ বা সিদ্ধান্ত সংশোধনে বোর্ডের ক্ষমতা"),
  LawItemSearch("৮১", "ক্ষমতা অর্পণ"),
  LawItemSearch("৮২", "মূসক কর্মকর্তাকে সহায়তা প্রদান"),
  LawItemSearch("৮৩", "মূসক কর্মকর্তার প্রবেশ ও তল্লাশির ক্ষমতা"),
  LawItemSearch("৮৪", "পণ্য জব্দকরণ ও উহার নিষ্পত্তি"),
  LawItemSearch("৮৫", "ব্যর্থতা বা অনিয়মের ক্ষেত্রে জরিমানা আরোপ"),
  LawItemSearch(
      "৮৬", "ন্যায় নির্ণয়ার্থ কাযধারা গ্রহণে মূসক কর্মকর্তাগণের আর্থিক সীমা"),
  LawItemSearch("৮৭", "সমন প্রেরণ"),
  LawItemSearch("৮৮", "শুল্ক কর্মকর্তাগণের দায়িত্ব এবং ক্ষমতা"),
  LawItemSearch("৮৯", "গোপনীয়তা"),
  LawItemSearch(
      "৮৯ক", "মূল্য সংযোজন কর আইনের ক্ষেত্রে অন্যান্য আইনের প্রয়োগ"),
  LawItemSearch("৯০", "করদাতা অর্থনৈতিক কার্যক্রম নিরীক্ষা এবং অনুসন্ধান"),
  LawItemSearch("৯১", "মূসক কর্মকর্তাগণের ক্ষমতা"),
  LawItemSearch("৯২", "তত্ত্বাবধানাধীন সরবরাহ, পর্যবেক্ষণ ও নজরদারী"),
  LawItemSearch("৯৩", "একাধিক দাপ্তরিক নিরীক্ষা"),
  LawItemSearch("৯৪", "বিশেষ নিরীক্ষা"),
  LawItemSearch("৯৫", "বকেয়া কর আদায়"),
  LawItemSearch("৯৬", "দেওয়ানী কাযবিধির অধীন মূসক কর্মকর্তার ক্ষমতা"),
  LawItemSearch("৯৭", "বকেয়া কর আদায়ের ক্ষেত্রে অধিক্ষেত্রের পরিবর্তন"),
  LawItemSearch("৯৮", "আদায়কৃত অর্থ বা জামানতের বিলিবন্টন"),
  LawItemSearch("৯৯",
      "খেলাপি করদাতার স্থাবর সম্পত্তির উপর সরকারের পূর্বস্বত্ব ও উহার ক্রোক"),
  LawItemSearch(
      "১০০", "পণ্য জব্দকরণ, উহার বিক্রয় ও বিক্রয়লব্ধ অর্থের বিলিবন্টন"),
  LawItemSearch("১০১", "প্রতিনিধির দায়িত্ব এবং বাধ্যবাধকতা"),
  LawItemSearch("১০২", "রিসিভারের দায়িত্ব"),
  LawItemSearch("১০৩",
      "কোম্পানি বা ব্যক্তি সংঘ বা সম্পত্তি উন্নয়নে যৌথ উদ্যোগের পরিচালক বা উদ্যোক্তার দায়"),
  LawItemSearch("১০৪", "অংশিদারী কারবার বা অনিগমিত সংঘের ধারাবাহিকতা"),
  LawItemSearch("১০৫", "করদাতার মৃত্যু বা দেউলিয়াত্ব ঘোষণা"),
  LawItemSearch("১০৬", "বকেয়া কর কিস্তিতে পরিশোধ"),
  LawItemSearch("১০৭", "রেকর্ডপত্র এবং হিসাব রক্ষণ"),
  LawItemSearch("১০৮", "ফরম, নোটিশ এবং দলিলপত্রের সত্যায়ন"),
  LawItemSearch("১০৯", "নোটিশ জারি"),
  LawItemSearch("১১০", "দলিলপত্রের বৈধতা"),
  LawItemSearch("১১১",
      "মূসক নিবন্ধন বা টার্ণওভার কর সনদপত্র ও কর দলিল সংক্রান্ত অপরাধ ও দন্ড"),
  LawItemSearch(
      "১১২", "মিথ্যা বা বিভ্রান্তিকর বিবৃতি বা বিবরণ প্রদানের অপরাধ ও দন্ড"),
  LawItemSearch("১১৩", "প্রতিবন্ধকতা সৃষ্টির অপরাধ ও দন্ড"),
  LawItemSearch("১১৪", "অপরাধের তদন্ত, বিচার ও আপীল"),
  LawItemSearch("১১৫",
      'জুডিশিয়াল ম্যাজিস্ট্রেট বা মেট্রোপলিটন ম্যাজিস্ট্রেটের অতিরিক্ত ক্ষমতা'),
  LawItemSearch("১১৬",
      "সংকোম্পানি, ব্যক্তি সংঘ বা সম্পত্তি উন্নয়নে যৌথ উদ্যোগ কর্তৃক অরাধ সংঘটনজ্ঞা"),
  LawItemSearch("১১৭", "অপরাধে সহায়তাকারী"),
  LawItemSearch("১১৮", "মামলা দায়েরের পূর্বানুমোদন"),
  LawItemSearch("১১৯", "অপরাধের আপোষরফা"),
  LawItemSearch("১২০", "অর্থদন্ড প্রদেয় করের অতিরিক্ত"),
  LawItemSearch("১২১", "কমিশনার (আপীল) এর নিকট আপীল"),
  LawItemSearch("১২২", "আপীলাত ট্রাইব্যুনালে আপীল"),
  LawItemSearch("১২৩", "কার্যধারায় সাক্ষ্য প্রমাণের দায়"),
  LawItemSearch("১২৪", "হাইকোর্ট বিভাগে রিভিশন"),
  LawItemSearch("১২৫", "বিকল্প উপায়ে বিরোধ নিষ্পত্তি"),
  LawItemSearch("১২৬", "সরকার কর্তৃক কর অব্যাহতি"),
  LawItemSearch("১২৬ক", "পুরস্কার ও কর্মদক্ষতা প্রণোদনা"),
  LawItemSearch("১২৭", "প্রদেয় করের উপর সুদ আরোপ"),
  LawItemSearch("১২৭ক", "সরকারী পাওনা অবলোপন ক্ষমতা"),
  LawItemSearch("১২৭খ",
      "কতিপয় পণ্য বা সেবার ক্ষেত্রে কর পরিশোধের সময় ও পদ্ধতি নির্ধারণ "),
  LawItemSearch(
      "১২৮", "অনলাইনে কার্যসম্পাদন, দাখিলপত্র পেশকরণ এবং কর পরিশোধ, ইত্যাদি"),
  LawItemSearch("১২৯", "আদালতে মামলা দায়েরের ক্ষেত্রে প্রতিবন্ধকতা"),
  LawItemSearch("১২৯ক", "সরল বিশ্বাসে কৃত কাজকর্মের সংরক্ষণ"),
  LawItemSearch("১৩০", "মূসক পরামর্শক নিয়োগ"),
  LawItemSearch("১৩১", "করণিক ত্রুটি ইত্যাদির সংশোধন"),
  LawItemSearch("১৩২", "দাখিলপত্রের প্রত্যায়িত অনুলিপি"),
  LawItemSearch("১৩৩", "মূসক ছাড়পত্র প্রদান"),
  LawItemSearch("১৩৪", "ব্যক্তি মালিকানাধীন প্রতিষ্ঠানের মাধ্যমে কার্যসম্পাদন"),
  LawItemSearch("১৩৫", "বিধি প্রণয়নের ক্ষমতা"),
  LawItemSearch("১৩৫ক", "মূসক কর্মকর্তা ও কর্মচারীদের "),
  LawItemSearch("১৩৬", "ইংরেজীতে অনুদিত পাঠ প্রকাশ"),
  LawItemSearch("১৩৭", "রহিতকরণ ও হেফাজত"),
  LawItemSearch("১৩৮", "ক্রান্তিকালীণ কর হিসাব"),
  LawItemSearch("১৩৯", "এই আইন প্রবর্তনের পর আবদ্ধ চুক্তি"),
];
List<BdItemSearch> bdList = [
  BdItemSearch("১", "সংক্ষিপ্ত শিরোনাম ও প্রবর্তন"),
  BdItemSearch("২", "সংজ্ঞা "),
  BdItemSearch("৩", "নিবন্ধন বা তালিকাভুক্তির সীমা নির্ধারণ"),
  BdItemSearch("৪", "নিবন্ধনের আবেদন ও নিবন্ধন প্রদান"),
  BdItemSearch("৫", "তালিকাভুক্তির আবেদন ও তালিকাভুক্তিকরণ"),
  BdItemSearch("৬", "স্বেচ্ছা নিবন্ধন"),
  BdItemSearch(
      "৭", "বিভাগীয় কর্মকর্তা কর্তৃক স্ব-উদ্যোগে নিবন্ধিত বা তালিকাভুক্তিকরণ"),
  BdItemSearch("৮", "মূসক নিবন্ধন বাতিল"),
  BdItemSearch("৯", "টার্ণওভার কর তালিকাভুক্তি বাতিল"),
  BdItemSearch("১০", "নিবন্ধিত বা তালিকাভুক্ত ব্যক্তিবর্গের তালিকা"),
  BdItemSearch("১১", "ব্যবসায় সনাক্তকরণ সংখ্যার ব্যবহার"),
  BdItemSearch("১২", "পরিবর্তিত তথ্য অবহিতকরণ"),
  BdItemSearch("১৩", "ব্যবসায়ের স্থান পরিবর্তন"),
  BdItemSearch("১৪", "নিবন্ধন সনদপত্র বা তালিকাভুক্তিপত্রের নকল"),
  BdItemSearch("১৫", "ক্রান্তিকালীণ নিবন্ধন বা তালিকাভুক্তি"),
  BdItemSearch("১৬", "মূসক এজেন্ট নিয়োগ, ইত্যাদি"),
  BdItemSearch("১৭", "মূসক এজেন্ট মনোনয়ন"),
  BdItemSearch("১৮ক",
      "আন্তর্জাতিক দরপত্রের বিপরীতে বৈদেশিক মুদ্রায় পণ্য সরবরাহ বা সেবা প্রদান"),
  BdItemSearch("১৮", "ট্রাভেল এজেন্ট এবং ট্যুর অপারেটর"),
  BdItemSearch("১৯", "আমদানি পর্যায়ে পরিশোধিত আগাম কর সমন্বয় ও ফেরত"),
  BdItemSearch("২০", "পণবিহীন করযোগ্য সরবরাহের মূল্য নির্ধারণ"),
  BdItemSearch("২১", "উপকরণ উৎপাদ সহগ ঘোষণা"),
  BdItemSearch("২২", "চলমান ব্যবসা বিক্রয়ের পদ্ধতি"),
  BdItemSearch("২৩",
      'আগাম মূল্য পরিশোধিত টেলিযোগাযোগ সেবা গ্রহণকারী বা দ্রব্য ব্যবহারকারী-'),
  BdItemSearch(
      "২৪", "অনিবন্ধিত পাওনাদার কর্তৃক ঋণ পরিশোধে সম্পত্তি বিক্রয়ের পদ্ধতি"),
  BdItemSearch("২৪ক", 'অব্যবহৃত বা ব্যবহারের অনুপযোগী উপকরণের নিম্পত্তিকরণ'),
  BdItemSearch(
      "২৪খ", 'দুর্ঘটনায় ক্ষতিগ্রস্ত বা ধ্বংসপ্রাপ্ত পণ্যের নিম্পত্তিকরণ'),
  BdItemSearch("২৪গ",
      'বর্জ্য (ওয়েস্ট) বা উপজাত (বাই-প্রোডাক্ট) পণ্যের সরবরাহ ও নিষ্পত্তিকরণ'),
  BdItemSearch("২৫", "কর পরিশোধ পদ্ধতি "),
  BdItemSearch("২৬", "আংশিক উপকরণ কর রেয়াত গ্রহণ"),
  BdItemSearch("২৭", "সমন্বয় ঘটনা প্রবাহের ক্ষেত্রে সরবরাহোত্তর সমন্বয় পদ্ধতি"),
  BdItemSearch("২৮", "অনাদায়ী পণের জন্য সরবরাহোত্তর সমন্বয়"),
  BdItemSearch(
      "২৯", "ব্যাংকিং ব্যাবস্থার মাধ্যমে অর্থ পরিশোধ না করার কারণে সমন্বয়"),
  BdItemSearch("৩০", "ব্যক্তিগত উদ্দেশ্যে ব্যবহৃত সম্পদের ক্ষেত্রে সমন্বয়"),
  BdItemSearch("৩১", "নিবন্ধিত হওয়ার ক্ষেত্রে উপকরণ কর ও মূসক সমন্বয়"),
  BdItemSearch("৩২", "নিবন্ধন বাতিলের পরিপ্রেক্ষিতে সমন্বয়"),
  BdItemSearch("৩৩", "পুনঃবিক্রয়ের জন্য ক্রীত ব্যবহৃত পণ্যের ক্ষেত্রে সমন্বয়"),
  BdItemSearch("৩৪", "বীমা সংক্রান্ত সমন্বয়"),
  BdItemSearch("৩৫",
      "লটারী, লাকী-ড্র, র‌্যাফেল ড্র, হাউজি এবং অনুরূপ কার্যক্রমের ক্ষেত্রে সমন্বয়"),
  BdItemSearch("৩৬", "করহার পরিবর্তনের ক্ষেত্রে সমন্বয়"),
  BdItemSearch("৩৭", "অনিবন্ধিত সরবরাহ গ্রহীতা কর্তৃক উৎসে কর্তৃত মূসক পরিশোধ"),
  BdItemSearch("৩৮",
      "হিসাব রক্ষণ কর্মকর্তা কর্তৃক অনিবন্ধিত সরবরাহ গ্রহীতার পক্ষে উৎসে মূসক কর্তন ও পরিশোধ"),
  BdItemSearch("৩৯", 'উৎসে কর্তনের পর সরবরাহকারী কর্তৃক হ্রাসকারী সমন্বয়'),
  BdItemSearch("৪০", "মূসক হিসাব রক্ষণ"),
  BdItemSearch("৪১", 'টার্ণওভার কর হিসাবরক্ষণ'),
  BdItemSearch("৪২", "ক্রয়-বিক্রয়ের তথ্য দাখিল"),
  BdItemSearch(
      "৪৪", "প্রতিনিধি কর্তৃক জারীকৃত অথবা প্রতিনিধি বরাবর জারীকৃত দলিল"),
  BdItemSearch("৪৪", "প্রতিলিপি সংক্রান্ত বাধানিষেধ"),
  BdItemSearch("৪৫", "রপ্তানির ক্ষেত্রে সম্পূরক শুল্ক সমন্বয়"),
  BdItemSearch("৪৬", "টার্ণওভার কর সমন্বয়"),
  BdItemSearch("৪৭", "দাখিলপত্র পেশ"),
  BdItemSearch("৪৮", "বিলম্বে দাখিলপত্র পেশের পদ্ধতি"),
  BdItemSearch("৪৯", "দাখিলপত্র সংশোধন"),
  BdItemSearch("৫০", 'পূর্ণ, অতিরিক্ত অথবা বিকল্প দাখিলপত্র'),
  BdItemSearch("৫১", "ডাক বা বাহক মারফত দাখিলপত্র দাখিলের ক্ষেত্রে সময় গণনা"),
  BdItemSearch("৫২", "ফেরত প্রদান"),
  BdItemSearch("৫৩", 'বাতিল'),
  BdItemSearch("৫৪", "ফেরত প্রদত্ত অর্থের প্রয়োগ"),
  BdItemSearch("৫৫",
      "কূটনৈতিক এবং অন্যান্য আন্তর্জাতিক সংস্থা কর্তৃক প্রদত্ত কর ফেরত প্রদান"),
  BdItemSearch("৫৬", "বৈদেশিক পর্যটকদের কর ফেরত"),
  BdItemSearch("৫৭",
      "বৈদেশিক পর্যটকদের মূসক ফেরত সনদ জারির লক্ষ্যে নিবন্ধিত ব্যক্তি নির্বাচন"),
  BdItemSearch("৫৭ক", "কর নির্ধারণ পদ্ধতি"),
  BdItemSearch("৫৮", "বিশেষ পরিকল্প (Scheme) হইতে কর সুবিধা রদকরণ (negation)"),
  BdItemSearch(
      "৫৯", "মূসক কর্মকর্তার আদেশ বা সিদ্ধান্ত সংশোধনে বোর্ডের ক্ষমতা"),
  BdItemSearch("৬০", "মূসক কর্মকর্তার প্রবেশ ও তল্লাশির ক্ষমতা"),
  BdItemSearch("৬১", 'রেকর্ড, দলিলপত্র, পণ্য বা পণ্যবাহী যান জব্দকরণ'),
  BdItemSearch("৬২", "জব্দকৃত রেকর্ড বা দলিলপত্র ফেরত প্রদান"),
  BdItemSearch("৬৩", "জব্দকৃত পণ্য ও পণ্যবাহী যান ছাড় প্রদান "),
  BdItemSearch("৬৫", "জরিমানা আরোপের পদ্ধতি"),
  BdItemSearch(
      "৬৪", "ব্যাংক হিসাব অপরিচালনযোগ্য (freeze) করিবার ক্ষমতা ও পদ্ধতি"),
  BdItemSearch("৬৬ক", "করদাতার কর সংশ্লিষ্ট কার্যক্রম নিরীক্ষা"),
  BdItemSearch("৬৬", "তত্ত্বাবধানাধীন সরবরাহ, পর্যবেক্ষণ ও নজরদারি"),
  BdItemSearch("৬৭", "বিশেষ নিরীক্ষা সম্পন্নের লক্ষ্যে নিরীক্ষক নিয়োগ"),
  BdItemSearch("৬৮", "বকেয়া কর আদায়ের সাধারণ পদ্ধতি"),
  BdItemSearch("৬৯",
      "কোনো আয়কর, শুল্ক, মূসক বা আবগারি কর্তৃপক্ষের নিয়ন্ত্রনাধীন অর্থ হইতে কর্তন পদ্ধতি"),
  BdItemSearch("৭০",
      "কোন ব্যক্তি, সহযোগী বা আর্থিক প্রতিষ্ঠান বা ব্যাংক হইতে কর্তন পদ্ধতি"),
  BdItemSearch(
      "৭১", "কোন খেলাপি করদাতার ব্যাংক হিসাব অপরিচালনযোগ্য করিবার পদ্ধতি"),
  BdItemSearch("৭২", "কোন খেলাপি করদাতার ব্যবসায় অঙ্গন তালাবদ্ধ করিবার পদ্ধতি"),
  BdItemSearch("৭৩", "কোন খেলাপি করদাতার অস্থাবর সম্পত্তি জব্দকরণ পদ্ধতি"),
  BdItemSearch("৭৪", "কোন খেলাপি করদাতার স্থাবর সম্পত্তি ক্রোক পদ্ধতি"),
  BdItemSearch("৭৫",
      "কোন খেলাপি করদাতার অস্থাবর সম্পত্তি জব্দকরণ বা স্থাবর সম্পত্তি ক্রোকের আদেশ জারি"),
  BdItemSearch("৭৬", 'খেলাপি করদাতার ব্যবসা অঙ্গন তালাবদ্ধকরণ-'),
  BdItemSearch("৭৭", "সুদ, খরচ, চার্জ ইত্যাদি"),
  BdItemSearch("৭৮", "যে সম্পত্তি ক্রোক বা জব্দ করা যাইবে না"),
  BdItemSearch("৭৯", "ডিক্রি স্থগিতকরণ"),
  BdItemSearch("৮০", "কর্মচারীর বেতন স্থগিতকরণ"),
  BdItemSearch("৮১", "শেয়ার বা হস্তান্তরযোগ্য দলিল জব্দকরণ"),
  BdItemSearch(
      "৮২", "ব্যাংক বা গণকর্মচারীর তত্ত্বাবধানে থাকা সম্পদ ক্রোক বা জব্দকরণ"),
  BdItemSearch("৮৩", "কোন যৌথ মালিকানার সম্পত্তি ক্রোক বা জব্দকরণ"),
  BdItemSearch(
      "৮৪", "সম্পত্তি ক্রোক বা জব্দকরনের পূর্বে উহার তালিকা প্রস্তুতকরণ"),
  BdItemSearch("৮৫", "সম্পত্তি ক্রোক বা জব্দকরণের সময়"),
  BdItemSearch("৮৬", "সম্পত্তি ক্রোক বা জব্দকরণের সীমা"),
  BdItemSearch("৮৭", "সম্পত্তি ক্রোক বা জব্দকরণের জন্য উহাতে প্রবেশের ক্ষমতা"),
  BdItemSearch("৮৮",
      "সম্পত্তি ক্রোক বা জব্দকরণের জন্য পুলিশসহ সরকারী-বেসরকারী কর্মকর্তার সহায়তা"),
  BdItemSearch("৮৯",
      'স্থাবর সম্পত্তি ক্রোক বা অস্থাবর সম্পত্তি জব্দের ক্ষেত্রে বকেয়া আদায়-'),
  BdItemSearch("৯০",
      "কোন খেলাপি করদাতার ক্রোকি স্থাবর সম্পত্তি বা জব্দকৃত অস্থাবর সম্পত্তি বিক্রয়ের পদ্ধতি"),
  BdItemSearch("৯১",
      "কোন খেলাপি করদাতার ক্রোকি স্থাবর সম্পত্তি বা জব্দকৃত অস্থাবর সম্পত্তি জব্দকরণের সার্টিফিকেট প্রত্যাহার"),
  BdItemSearch("৯২", "খেলাপি করদাতার কোন জিম্মাদারের নিকট হইতে জামানত গ্রহণ"),
  BdItemSearch("৯৩", "রিসিভার কর্তৃক কর পরিশোধের পদ্ধতি"),
  BdItemSearch("৯৪", "বকেয়া কর কিস্তিতে পরিশোধের পদ্ধতি"),
  BdItemSearch("৯৫", "রেকর্ড এবং হিসাব সংরক্ষণ"),
  BdItemSearch("৯৬", "অপরাধের তদন্ত পদ্ধতি"),
  BdItemSearch("৯৭", "অপরাধের আপোষরফার পদ্ধতি"),
  BdItemSearch("৯৮", "কমিশনার (আপিল) এর নিকট আপিল ও উহার নিষ্পত্তির পদ্ধতি"),
  BdItemSearch("৯৯", "বিকল্প বিরোধ নিষ্পত্তির পদ্ধতি"),
  BdItemSearch("১০০", "সহায়তাকারীর বিরুদ্ধে আপত্তি"),
  BdItemSearch("১০১", "সহায়তাকারীর যোগ্যতা, নিয়োগ এবং তালিকা"),
  BdItemSearch("১০২", "সহায়তাকারীর দায়িত্ব ও কর্তব্য"),
  BdItemSearch("১০৩", "সহায়তাকারীর আচরণ-বিধি"),
  BdItemSearch("১০৪", "স্বার্থের দ্বন্দ"),
  BdItemSearch(
      "১০৫", "বিকল্প বিরোধ নিষ্পত্তির ক্ষেত্রে আবেদনকারীর অধিকার ও দায়িত্ব"),
  BdItemSearch("১০৬", "মূল্য সংযোজন কর বিভাগের জন্য বিভাগীয় সহায়তাকারী মনোনয়ন"),
  BdItemSearch("১০৭", "সহায়তাকারীর সম্মানী"),
  BdItemSearch("১০৮", "অধিকার সংরক্ষণ"),
  BdItemSearch("১০৯", "মূসক পরামর্শক লাইসেন্স প্রদান পদ্ধতি"),
  BdItemSearch(
      "১১০", "মূসক পরামর্শক লাইসেন্সের জন্য আবেদনকারীর যোগ্যতা ও অযোগ্যতা"),
  BdItemSearch("১১১", "আবেদনের জন্য প্রয়োজনীয় দলিলাদি"),
  BdItemSearch("১১২", 'বাতিল'),
  BdItemSearch("১১৩", "মূসক পরামর্শকের দায়িত্ব"),
  BdItemSearch("১১৪", "মূসক পরামর্শকের অপরাধ ও দন্ড"),
  BdItemSearch("১১৫", "দলিলপত্রের প্রত্যয়িত অনুলিপি"),
  BdItemSearch("১১৬", "মূসক ছাড়পত্র ও সম্মাননাপত্র প্রদানের পদ্ধতি"),
  BdItemSearch("১১৭", "মূসক ছাড়পত্র ও সম্মাননাপত্রের ব্যবহার"),
  BdItemSearch("১১৮ক",
      "আদেশ, বিজ্ঞপ্তি, ব্যাখ্যা, পরিপত্র, স্পষ্টিকরণ ইত্যাদি জারির ক্ষমতা"),
  BdItemSearch("১১৮খ", "সরবরাহ প্রদান হইতে সাময়িক বিরতির ঘোষণা।"),
  BdItemSearch("১১৮",
      'আদেশ, বিজ্ঞপ্তি, ব্যাখ্যা, পরিপত্র, স্পষ্টিকরণ ইত্যাদি জারির ক্ষমতা'),
  BdItemSearch("১১৯", "রহিতকরণ ও হেফাজতকরণ"),
];

Future<bool> netCheck() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}