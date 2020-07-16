import 'package:AibolitFlutter/entity/city.dart';
import 'package:AibolitFlutter/entity/clinic.dart';
import 'package:AibolitFlutter/entity/doctor.dart';
import 'package:AibolitFlutter/entity/program.dart';
import 'package:AibolitFlutter/entity/request_item.dart';
import 'package:AibolitFlutter/entity/setting_item.dart';
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

  static Clinic center1 = Clinic(
    'assets/img/clinic/zamk.jpg',
    'МЦ "Лодэ" на Замковой',
    'Гродно, ул. Замковая, д. 4',
  );
  static Clinic center2 = Clinic(
    'assets/img/clinic/poli.jpg',
    'МЦ "Лодэ" на Полиграфистов',
    'Гродно, ул. Полиграфистов, д. 2',
  );
  static List<Clinic> centers = [center1, center2];
  static List<Clinic> programCenters = [center1, center2];

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
    firstName: 'Юлия',
    lastName: 'Савицкая',
    middleName: 'Валентиновна',
    specialityLong: 'врач-стоматолог-терапевт',
    speciality: 'врач-стоматолог',
    centers: [center1],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );
  static Doctor doctor2 = Doctor(
    firstName: 'Галина',
    lastName: 'Мурысева',
    middleName: 'Андреевна',
    speciality: 'рентген-лаборант',
    specialityLong: 'рентген-лаборант',
    centers: [center1],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );
  static Doctor doctor3 = Doctor(
    firstName: 'Светлана',
    lastName: 'Монастырская',
    middleName: 'Сергеевна',
    speciality: 'врач-оториноларинолог',
    specialityLong: 'врач-оториноларинолог',
    centers: [center2],
    profiles: ['Взрослые', 'Дети с 0 лет'],
  );

  static Map<Program, List<Doctor>> programToDoctors = {
    program1: [doctor1, doctor2],
    program2: [doctor1]
  };

  static Visit visit = Visit(
    owner: user1,
    doctor: doctor1,
    center: center1,
    date: DateTime.now().add(Duration(hours: 1)),
  );

  static final List<Visit> visits = [
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 7, 17, 16),
      Data.center1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user2,
      DateTime.now().add(Duration(hours: 2)),
      Data.center2,
      Data.doctor3,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime.now().add(Duration(hours: 1)),
      Data.center2,
      Data.doctor2,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime.now().add(Duration(hours: 1)),
      Data.center2,
      Data.doctor3,
    ),
    Data.getVisitWithDate(
      Data.user2,
      DateTime.now().add(Duration(hours: 1)),
      Data.center2,
      Data.doctor1,
    ),
    Data.visit,
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 25, 15, 30),
      Data.center1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 24, 12),
      Data.center1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 10, 13),
      Data.center1,
      Data.doctor1,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 6, 9, 9, 30),
      Data.center1,
      Data.doctor2,
    ),
    Data.getVisitWithDate(
      Data.user1,
      DateTime(2020, 4, 3, 16, 35),
      Data.center2,
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

  static List<SettingItem> settingItems = [
    SettingItem('О проекте', 'https://aibolit.md/mobile'),
    SettingItem('Пользовательское соглашение',
        'https://aibolit.md/polzovatelskoe-soglashenie'),
    SettingItem('Политика конфиденциальности',
        'https://aibolit.md/politika-konfidencialnosti'),
    SettingItem('Обратиться в поддержку', 'support@aibolit.md', isEmail: true,),
    SettingItem(
        'Предложения по улучшению Aibolit', 'https://aibolit.uservoice.com/'),
  ];

  static List<String> addFamilyActions = [
    'Добавить ребенка',
    'Поделиться предложением',
    'Мой код для предложения к семье',
    'Ввести код своего супруга(и)',
  ];
  static Map<String, bool> notifications = {
    'За 30 минут' : false,
    'За 1 час' : false,
    'За 2 часа' : false,
    'За 4 часа' : false,
    'За 1 день, в 10:00 утра' : false,
    'За 1 день, в 20:00 вечера' : false,
  };

}
