import 'package:AibolitFlutter/entity/action.dart';
import 'package:AibolitFlutter/entity/city.dart';
import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/doctor.dart';
import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/entity/request_item.dart';
import 'package:AibolitFlutter/entity/user.dart';
import 'package:AibolitFlutter/entity/visit.dart';

class Data {
  static final stubAsset = 'assets/img/user_avatar.png';

  static Program program1 = Program(
    logo: 'assets/img/epam_logo.png',
    title: 'EPAM Health Care',
    company: 'ЭПАМ Системз',
    program: 'EPAM Взрослые (Гродно)',
  );
  static Program program2 = Program(
    logo: 'assets/img/epam_logo.png',
    title: 'EPAM Health Care',
    company: 'ЭПАМ Системз',
    program: 'EPAM Дети (Гродно)',
  );

  static List<Program> epamPrograms = [
    program1,
    program2,
  ];

  static Clinic clinic1 = Clinic(
    logo: 'assets/img/clinic/zamk.jpg',
    title: 'МЦ "Лодэ" на Замковой',
    town: 'Гродно',
    address: 'ул. Замковая, д. 4',
    isOnline: true,
    x: "53.6774916",
    y: '23.8273426',
  );
  static Clinic clinic2 = Clinic(
    logo: 'assets/img/clinic/poli.jpg',
    title: 'МЦ "Лодэ" на Полиграфистов',
    town: 'Гродно',
    address: 'ул. Полиграфистов, д. 2',
    isOnline: true,
    x: "53.6747074",
    y: '23.8399295',
  );
  static Clinic clinic3 = Clinic(
    logo: 'assets/img/hospitalwithoutphoto.png',
    title: 'УЗ "Гродненский областной клинический перинатальный центр"',
    town: 'Гродно',
    address: 'ул. Горького, д. 77',
    x: "53.7002635",
    y: '23.81894',
  );
  static Clinic clinic4 = Clinic(
    logo: 'assets/img/hospitalwithoutphoto.png',
    title: 'МЦ "МедХаус"',
    town: 'Гродно',
    address: 'ул. Брикеля, 25/2-2 этаж',
    x: "53.6971877",
    y: '23.8515593',
  );
  static Clinic clinic5 = Clinic(
    logo: 'assets/img/hospitalwithoutphoto.png',
    title: 'УЗ "Гродненский областной эндокринологический диспансер"',
    town: 'Гродно',
    address: 'ул. Болдина, 11',
    x: "53.6971877",
    y: '23.8515593',
  );
  static List<Clinic> clinicBookmarks = [];
  static List<Clinic> clinics = [clinic1, clinic2, clinic3, clinic4, clinic5];
  static List<Clinic> epamClinics = [clinic1, clinic2];

  static User guest = User(
    avatar: stubAsset,
  );

  static User owner = User(
    firstName: 'Алексей',
    middleName: 'Олегович',
    lastName: 'Шванц',
    birthDay: DateTime(1991, 9, 11),
    phoneNumber: '375295786646',
    email: 'ashvants91@gmail.com',
    program: program1,
    avatar: 'assets/img/shvants.jpg',
    city: cities[3],
    family: [user2],
  );

  static User user1 = User(
    firstName: 'Алексей',
    middleName: 'Олегович',
    lastName: 'Шванц',
    birthDay: DateTime(1991, 9, 11),
    phoneNumber: '375295786646',
    email: 'ashvants91@gmail.com',
    program: program1,
    avatar: 'assets/img/shvants.jpg',
    city: cities[3],
    family: [user2],
  );
  static User user2 = User(
    firstName: 'Надежда',
    middleName: 'Алексеевна',
    lastName: 'Шванц',
    birthDay: DateTime(2016, 9, 14),
    phoneNumber: '375295786646',
    email: 'ashvants91@gmail.com',
    program: program2,
    avatar: 'assets/img/nadzeya.jpg',
    city: cities[3],
    family: [],
  );

  static Doctor doctor1 = Doctor(
    avatar: 'assets/img/doctorwithoutphoto.png',
    firstName: 'Юлия',
    lastName: 'Савицкая',
    middleName: 'Валентиновна',
    specialityLong: 'врач-стоматолог-терапевт',
    speciality: 'врач-стоматолог',
    centers: [clinic1, clinic2],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );
  static Doctor doctor2 = Doctor(
    avatar: 'assets/img/doctorwithoutphoto.png',
    firstName: 'Галина',
    lastName: 'Мурысева',
    middleName: 'Андреевна',
    speciality: 'рентген-лаборант',
    specialityLong: 'рентген-лаборант',
    centers: [clinic1, clinic2],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );
  static Doctor doctor3 = Doctor(
    avatar: 'assets/img/doctorwithoutphoto.png',
    firstName: 'Светлана',
    lastName: 'Монастырская',
    middleName: 'Сергеевна',
    speciality: 'врач-оториноларинолог',
    specialityLong: 'врач-оториноларинолог',
    centers: [clinic2],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );

  static List<Doctor> doctors = [doctor1, doctor2, doctor3];
  static List<Doctor> bookmarkDoctors = [];

  static Map<Program, List<Doctor>> programToDoctors = {
    program1: [doctor1, doctor2],
    program2: [doctor1]
  };

  static Visit visit = Visit(
    owner: user1,
    doctor: doctor1,
    center: clinic1,
    date: DateTime.now().add(Duration(hours: 1)),
  );

  static final List<Visit> visits = [
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 7, 17, 16),
      Data.clinic1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user2,
      DateTime.now().add(Duration(hours: 2)),
      Data.clinic2,
      Data.doctor3,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime.now().add(Duration(hours: 1)),
      Data.clinic2,
      Data.doctor2,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime.now().add(Duration(hours: 1)),
      Data.clinic2,
      Data.doctor3,
    ),
    Data.getVisitWithDate(
      Data.user2,
      DateTime.now().add(Duration(hours: 1)),
      Data.clinic2,
      Data.doctor1,
    ),
    Data.visit,
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 25, 15, 30),
      Data.clinic1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 24, 12),
      Data.clinic1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 10, 13),
      Data.clinic1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 9, 9, 30),
      Data.clinic1,
      Data.doctor2,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 4, 3, 16, 35),
      Data.clinic2,
      Data.doctor3,
    ),
  ];

  static getVisitWithDate(
          User owner, DateTime date, Clinic center, Doctor doctor) =>
      Visit(
        owner: owner,
        doctor: doctor,
        center: center,
        date: date,
      );

  static List<RequestItem> popularRequests = [
    RequestItem('Терапевт', true),
    RequestItem('Хирург', true),
    RequestItem('Педиатр', true),
    RequestItem('Офтальмолог', true),
    RequestItem('Мирасептин', false),
    RequestItem('Септоцид', false),
    RequestItem('Маска медицинская', false),
  ];

  static List<City> cities = [
    City(1, 'Брест'),
    City(2, 'Витебск'),
    City(3, 'Гомель'),
    City(4, 'Гродно'),
    City(5, 'Минск'),
    City(6, 'Могилев'),
  ];

  static List<ActionItem> settingActions = [
    ActionItem(
      title: 'О проекте',
      url: 'https://aibolit.md/mobile',
    ),
    ActionItem(
      title: 'Пользовательское соглашение',
      url: 'https://aibolit.md/polzovatelskoe-soglashenie',
    ),
    ActionItem(
      title: 'Политика конфиденциальности',
      url: 'https://aibolit.md/politika-konfidencialnosti',
    ),
    ActionItem(
      title: 'Обратиться в поддержку',
      url: 'support@aibolit.md',
      isEmail: true,
    ),
    ActionItem(
      title: 'Предложения по улучшению Aibolit',
      url: 'https://aibolit.uservoice.com/',
    ),
  ];

  static List<String> addFamilyActions = [
    'Добавить ребенка',
    'Поделиться предложением',
    'Мой код для предложения к семье',
    'Ввести код своего супруга(и)',
  ];
  static Map<String, bool> notifications = {
    'За 30 минут': false,
    'За 1 час': false,
    'За 2 часа': false,
    'За 4 часа': false,
    'За 1 день, в 10:00 утра': false,
    'За 1 день, в 20:00 вечера': false,
  };
}
