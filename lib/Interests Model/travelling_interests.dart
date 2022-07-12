class TravelingInterests {
  static TravelingInterests? _instance;

  static TravelingInterests init() {
    if (_instance != null) {
      return _instance!;
    } else {
      return _instance = TravelingInterests();
    }
  }

  final List<String> _travellingInterests = [
    'Паломнический-религиозный 🧘🏻‍♂️ ',
    'Музыкальные фестивали 🎼',
    'Оздоровительный отдых 💆‍♀️ ',
    'Абхазия',
    'Австралия 🇦🇺',
    'Австрия 🇦🇹',
    'Азербайджан 🇦🇿',
    'Албания 🇦🇱',
    'Алжир 🇩🇿',
    'Ангола 🇦🇴',
    'Андорра 🇦🇩',
    'Антигуа и Барбуда 🇦🇬',
    'Аргентина 🇦🇷',
    'Армения 🇦🇲',
    'Афганистан 🇦🇫',
    'Багамские Острова 🇧🇸',
    'Бангладеш 🇧🇩',
    'Барбадос 🇧🇧',
    'Бахрейн 🇧🇭',
    'Белиз 🇧🇿',
    'Белоруссия 🇧🇾',
    'Бельгия 🇧🇪',
    'Бенин 🇧🇯',
    'Болгария 🇧🇬',
    'Боливия 🇧🇴',
    'Босния и Герцеговина 🇧🇦',
    'Ботсвана 🇧🇼',
    'Бразилия 🇧🇷',
    'Бруней 🇧🇳',
    'Буркина-Фасо 🇧🇫',
    'Бурунди 🇧🇮',
    'Бутан 🇧🇹',
    'Вануату 🇻🇺',
    'Ватикан 🇻🇦',
    'Великобритания 🇬🇧',
    'Венгрия 🇭🇺',
    'Венесуэла 🇻🇪',
    'Восточный Тимор 🇹🇱',
    'Вьетнам 🇻🇳',
    'Габон 🇬🇦',
    'Гаити 🇭🇹',
    'Гайана 🇭🇹',
    'Гамбия 🇬🇲',
    'Гана 🇬🇭',
    'Гватемала 🇬🇹',
    'Гвинея 🇬🇳',
    'Гвинея-Бисау 🇬🇼',
    'Германия 🇩🇪',
    'Гондурас 🇭🇳',
    'Палестина 🇵🇸',
    'Гренада 🇬🇩',
    'Греция 🇬🇷',
    'Грузия 🇬🇪',
    'Дания 🇩🇰',
    'Джибути 🇨🇩',
    'Доминика 🇩🇲',
    'Доминиканская Республика 🇩🇴',
    'Конго 🇨🇩',
    'Египет 🇪🇬',
    'Замбия 🇿🇲',
    'Западная Сахара 🇪🇭',
    'Зимбабве 🇿🇼',
    'Израиль 🇮🇱',
    'Индия 🇮🇳',
    'Индонезия 🇮🇩',
    'Иордания 🇯🇴',
    'Ирак 🇮🇶',
    'Иран 🇮🇷',
    'Ирландия 🇮🇪',
    'Исландия 🇮🇸',
    'Испания 🇪🇸',
    'Италия 🇮🇹',
    'Йемен 🇾🇪',
    'Кабо-Верде 🇨🇻',
    'Казахстан 🇰🇿',
    'Камбоджа 🇰🇭',
    'Камерун 🇨🇲',
    'Канада 🇨🇦',
    'Катар 🇶🇦',
    'Кения 🇰🇪',
    'Кипр 🇨🇾',
    'Киргизия 🇰🇬',
    'Кирибати 🇰🇮',
    'Китай 🇨🇳',
    'КНДР 🇰🇵',
    'Корея 🇰🇵',
    'Колумбия 🇨🇴',
    'Коморские Острова 🇰🇲',
    'Косово',
    'Коста-Рика 🇨🇷',
    'Кот-д 🇨🇮',
    'Куба 🇨🇺',
    'Кувейт 🇰🇼',
    'Лаос 🇱🇦',
    'Латвия 🇱🇻',
    'Лесото 🇱🇸',
    'Либерия 🇱🇷',
    'Ливан 🇱🇧',
    'Ливия 🇱🇾',
    'Литва 🇱🇹',
    'Лихтенштейн 🇱🇮',
    'Люксембург 🇱🇺',
    'Маврикий 🇲🇺',
    'Мавритания',
    'Мадагаскар 🇲🇬',
    'Малави 🇲🇼',
    'Малайзия 🇲🇾',
    'Мали 🇲🇱',
    'Мальдивы 🇲🇻',
    'Мальта 🇲🇹',
    'Марокко 🇲🇦',
    'Маршалловы Острова 🇲🇭',
    'Мексика 🇲🇽',
    'Мозамбик 🇲🇿',
    'Молдавия 🇲🇩',
    'Монако 🇲🇨',
    'Монголия 🇲🇳',
    'Мьянма 🇲🇲',
    'Намибия 🇳🇦',
    'Науру 🇳🇷',
    'Непал 🇳🇵',
    'Нигер 🇳🇪',
    'Нигерия 🇳🇬',
    'Нидерланды 🇳🇺',
    'Никарагуа 🇳🇮',
    'Новая Зеландия 🇳🇿',
    'Норвегия 🇳🇴',
    'ОАЭ 🇦🇪',
    'Объединённые Арабские Эмираты 🇦🇪',
    'Оман 🇴🇲',
    'Пакистан 🇵🇰',
    'Палау 🇵🇼',
    'Панама 🇵🇦',
    'Папуа - Новая Гвинея 🇵🇬',
    'Парагвай 🇵🇾',
    'Перу 🇵🇪',
    'Польша 🇵🇱',
    'Португалия 🇵🇹',
    'Македония 🇲🇰',
    'Россия 🇷🇺',
    'Руанда 🇷🇼',
    'Румыния 🇷🇴',
    'Сальвадор 🇸🇻',
    'Самоа 🇼🇸',
    'Сан-Марино 🇸🇲',
    'Сан-Томе и Принсипи 🇸🇹',
    'Саудовская Аравия 🇸🇦',
    'Сейшельские Острова 🇸🇨',
    'Сенегал 🇸🇳',
    'Сент-Винсент и Гренадины 🇻🇨',
    'Сент-Китс и Невис 🇰🇳',
    'Сент-Люсия 🇱🇨',
    'Сербия 🇷🇸',
    'Сингапур 🇸🇬',
    'Сирия 🇸🇾',
    'Словакия 🇸🇰',
    'Словения 🇸🇮',
    'Соломоновы Острова 🇸🇧',
    'Сомали 🇸🇴',
    'Судан 🇸🇩',
    'Суринам 🇸🇷',
    'США 🇺🇸',
    'Сьерра-Леоне 🇸🇱',
    'Таджикистан 🇹🇯',
    'Таиланд 🇹🇭',
    'Тайвань 🇹🇼',
    'Танзания 🇹🇿',
    'Того 🇹🇬',
    'Тонга 🇹🇴',
    'Тринидад и Тобаго 🇹🇹',
    'Тувалу 🇹🇻',
    'Тунис 🇹🇳',
    'Туркменистан 🇹🇲',
    'Турция 🇹🇷',
    'Уганда 🇺🇬',
    'Узбекистан 🇺🇿',
    'Украина 🇺🇦',
    'Уругвай 🇺🇾',
    'Микронезия 🇫🇲',
    'Фиджи 🇫🇯',
    'Филиппины 🇵🇭',
    'Финляндия 🇫🇮',
    'Франция 🇫🇷',
    'Хорватия 🇭🇷',
    'ЦАР 🇨🇫',
    'Острова Кука 🇨🇰',
    'Чад 🇹🇩',
    'Черногория 🇲🇪',
    'Чехия 🇨🇿',
    'Чили 🇨🇱',
    'Швейцария 🇨🇭',
    'Швеция 🇸🇪',
    'Шри-Ланка 🇱🇰',
    'Эквадор 🇪🇨',
    'Экваториальная Гвинея 🇬🇶',
    'Эритрея 🇪🇷',
    'Эсватини 🇸🇿',
    'Эстония 🇪🇪',
    'Эфиопия 🇪🇹',
    'ЮАР 🇿🇦',
    'Южная Осетия',
    'Южный Судан 🇸🇸',
    'Ямайка 🇯🇲',
    'Япония 🇯🇵',
    'Азад Джамму и Кашмир',
    'Анс-Интенданс',
    'Мануэль-Антонио',
    'Каунаоа',
    'Кампс-Бэй',
    'Бора-Бора',
    'Игл-Бич',
    'Карвоэйро',
    'Саус Бич',
    'Севен Майл',
    'Ипанема',
    'Баваро',
    'Нисси',
    'Прананг',
    'Скала-деи-Турки',
    'Пуналуу',
    'Натадола',
    'Палм-Бич',
    'Фиг Три',
    'Сурс-д’Аржан',
    'Копакабана',
    'Сал ',
    'Фонимагуду',
    'Пинк Сэндс',
    'Голубая лагуна',
    'Кот-де-Баск',
    'Вайкики',
    'Бенажил',
    'Элафонисси',
    'Гранд-Ансе',
    'Варадеро',
    'Остров Дераван',
    'Коэкоэ',
    'Порто Кацики',
    'Фулхадху',
    'Анс-Лацио',
    'Вайт Сенд',
    'Кайо-де-Агуа',
    'Легзира',
    'Ксамиль',
    'Свети-Стефан',
    'Миртос',
    'Шампань',
    'Кафедрал Коув',
    'Радханагар',
    'Кала-Голоритце',
    'Диани-Бич',
    'Златни Рат',
    'Треже Кэй',
    'Плайя дель Амор',
    'Ламаи',
    'Расду',
    'Унаватуна',
    'Май Кхе',
    'Крейн',
    'Йелапа',
    'Вужижу',
    'Пфайффер',
    'Сокотра',
    'Хорсшу-Бэй',
    'Варкала',
    'Нуса Дуа',
    'Навагио',
    'Аль Джисса',
    'Басс',
    'Шарм-эль-Шейх',
    'Каанапали',
    'Кампеше',
    'Рейли-Бич',
    'Санни Айлс',
    'Параисо',
    'Хувахендху',
    'Гуана Кей',
    'Са-Калета',
    'Ибица',
    'Маринья',
    'Акумаль',
    'Сэнди Лейн',
    'Грейс Бэй',
    'Теркс ',
    'Кайкос',
    'Изола-деи-Конильи',
    'Палолем',
    'Тангси',
    'Миртл Бич',
    'Сантос',
    'Уорик-Лонг-Бэй',
    'Кала-Форментор',
    'Гуардалавака',
    'Компорта',
    'Пиа',
    'Тобакко-Бэй',
    'Кокоа',
    'Лопес Мендес',
    'Сао',
    'Аитутаки',
    'Лоанго',
    'Докторс Кейв',
    'Мадерас',
    'Рас-Умм-Сид',
    'Кондадо',
    'Фламенко',
    'Тумон',
    'Шерегеш',
    'Белокуриха',
    'Кировск',
    'Красная Поляна',
    'Домбай',
    'Белорецк',
    'Губаха',
    'Хвалынск',
    'Байкальск ',
    'Австралия',
    'Легс-Тор',
    'Маунт-Баффало',
    'Австрия',
    'Шладминг',
    'Бад-Клайнкирххайм',
    'Бад-Хофгастайн',
    'Бадгастайн',
    'Зальбах-Хинтерглемм',
    'Земмеринг ',
    'Зерфаус',
    'Зефельд-ин-Тироль',
    'Иннеркремс',
    'Инсбрук',
    'Ишгль',
    'Капрун',
    'Кицбюэль',
    'Крайшберг',
    'Лех',
    'Майрхофен',
    'Нойштифт-им-Штубайталь',
    'Обергургль',
    'Санкт-Антон-ам-Арльберг',
    'Санкт-Кристоф',
    'Тульфес',
    'Фульпмес',
    'Хинтертукс',
    'Хохзёльден',
    'Целль-ам-Зе',
    'Цюрс',
    'Штубен',
    'Азербайджан',
    'Туфан',
    'Шахдаг',
    'Андорра',
    'Пас-де-ла-Каса',
    'Сольдеу',
    'Аргентина',
    'Сан-Карлос-де-Барилоче',
    'Эскель ',
    'Армения',
    'Цахкадзор',
    'Белоруссия',
    'Логойск',
    'Раубичи',
    'Силичи',
    'Болгария',
    'Банско',
    'Боровец',
    'Пампорово',
    'Босния и Герцеговина',
    'Купрес',
    'Греция',
    'Велухи',
    'Вици',
    'Писодери',
    'Грузия',
    'Бакуриани',
    'Гудаури',
    'Местиа',
    'Индия',
    'Гульмарг',
    'Манали',
    'Иран',
    'Дарбандсар',
    'Абали',
    'Дизин',
    'Пулядкаф',
    'Тучаль',
    'Шемшак',
    'Италия',
    'Курмайор',
    'Альта-Бадия',
    'Белая долина',
    'Брёй-Червиния',
    'Валь-Гардена',
    'Валь-ди-Фьемме',
    'Доломиты-Суперски',
    'Кортина-д’Ампеццо',
    'Мадонна-ди-Кампильо',
    'Пьянкавалло',
    'Сестриере',
    'Сьюзи-алло-Шильяр',
    'Казахстан',
    'Еликты',
    'Табаган',
    'Чимбулак',
    'Канада',
    'Мон-Трамблан',
    'курорт Альберты',
    'Накиска',
    'Сайпресс-Маунтин',
    'Уистлер-Блэккомб',
    'Норвегия',
    'Бейтостёлен',
    'Гейло',
    'Нордсетер',
    'Шушен',
    'Польша',
    'Висла',
    'Душники-Здруй',
    'Закопане',
    'Карпач',
    'Крыница-Здруй',
    'Пивнична-Здруй',
    'Шклярска-Поремба',
    'Щавница',
    'Щирк',
    'Россия',
    'Архыз',
    'Ведучи ',
    'Манжерок',
    'Горный воздух',
    'Кувандык',
    'Молоковка',
    'Новинки',
    'Приисковое',
    'Красная Глинка',
    'Сорочаны',
    'Хабарское',
    'Хвойный урман',
    'Цей',
    'Чегет',
    'Чекерил',
    'Румыния ',
    'Пояна-Брашов',
    'Семенич',
    'Северная Македония',
    'Кожуф',
    'Маврово',
    'Словакия',
    'Високе-Татри',
    'Вратная долина',
    'Ясна',
    'США',
    'Айдахо',
    'Колорадо',
    'Юта',
    'Аризона Сноубоул',
    'Бреттон-Вудс',
    'Монтаж-Маунтин',
    'Скво-Вэлли',
    'Уайтфейс',
    'Турция',
    'Малый Олимп',
    'Паландокен',
    'Ылгаз',
    'Украина',
    'Буковель',
    'Вышков',
    'Драгобрат',
    'Пилипец',
    'Славское',
    'Тисовец',
    'Финляндия',
    'Исо-Сюёте',
    'Леви',
    'Пюхя',
    'Рука',
    'Тахко',
    'Юлляс',
    'Франция',
    'Аворья',
    'Альп-д’Юэз',
    'Валь Торанс',
    'Валь-д’Изер',
    'Куршевель',
    'Ла-Плань',
    'Ла-Танья',
    'Ле-Дёз-Альп',
    'Лез-Арк',
    'Лез-Уш',
    'Люз Ардиден',
    'Межев',
    'Мерибель',
    'Мон-Дор',
    'Орон ',
    'Ризуль',
    'Серен',
    'Тинь',
    'Шервиллер',
    'Хорватия',
    'Медведница',
    'Чехия',
    'Гаррахов',
    'Шпиндлерув-Млин',
    'Яворжице',
    'Швейцария',
    'Гриндельвальд',
    'Давос',
    'Андерматт',
    'Аннивье',
    'Вербье',
    'Гштад',
    'Интерлакен',
    'Лойкербад',
    'Санкт-Мориц',
    'Церматт',
    'Швеция',
    'Оре',
    'Тенндален',
    'Корея',
    'Альпензия',
    'Бугван Фёникс Парк',
    'Ёнпхён',
    'Чунбон',
    'Япония',
    'Сига Когэн',
    'Роза Хутор',
    'Горки Город',
    'Абзаково',
    'Игора',
    'Хибины',
    'Большой Вудъявр',
    'Соболиная гора',
    'Завьялиха',
    'Бобровый лог',
    'Червиния',
    'Ревелсток',
    'Вейл',
    'Кортина ',
    'Аспен',
    'Парк-Сити',
    'Риксгрансен',
    'Бормио',
    'Сэлен',
    'Ишгель',
    'Бакейра-Берет',
    'Китцбюэль',
    'Хемседал',
    'Шамони',
    'Уистлер ',
    'Теллурайд',
    'Санкт-Петербург',
    'Карелия',
    'Карачаево-Черкесия',
    'Крым',
    'Никола-Ленивец',
    'Коми',
    'Якутия',
    'Москва',
    'Сибирь',
    'Забайкалье ',
    'Сочи',
    'Архангельск',
    'Байкао',
    'Улан-Удэ',
    'Грозный',
    'Калининград',
    'Владивосток',
    'Алтай',
    'Екатеринбург',
    'Великий Новгород',
    'Камчатка',
    'Волгоград',
    'Дагестан',
    'Иркутск',
    'Татарстан',
    'Казань',
    'Ингушетия',
    'Дальний восток',
    'Хакасия',
    'Беринговое море',
    'Чукотка',
    'Московская область',
    'Сахалин',
    'Осетия',
    'Мурманск',
    'Кабардино-Балкария',
    'Эльбрус',
    'Териберка',
    'Суздаль',
    'Владимир',
    'Пермь',
    'Курильские острова',
    'Северная Осетия-Алания',
    'Воронеж',
    'Севастополь',
    'Нижний Новгород',
    'Красноярск',
    'Ярославль',
    'Псков',
    'Сергиев Посад',
    'Вологда',
    'Переславль-Залесский',
    'Самара',
    'Пятигорск',
    'Ростов-на-Дону',
    'Рязань',
    'Смоленск',
    'Тула',
    'Кострома',
    'Анапа',
    'Краснодар',
    'Новороссийск',
    'Уфа',
    'Геленджик',
    'Новосибирск',
    'Тверь',
    'Выборг',
    'Коломна',
    'Челябинск',
    'Каргополь',
    'Эссо',
    'Вятское',
    'Плес',
    'Светлогорск',
    'Старый Изборск',
    'Осташков',
    'Сортавала',
    'Ростов Великий',
    'Шлиссельбург',
    'Кириллов',
    'Свяжск',
    'Углич',
    'Акротири',
    'Гернси',
    'Гибралтар',
    'Декелия',
    'Джерси',
    'Нидерланды 🇳🇱',
    'Остров Мэн',
    'Фарерские острова',
    'Шпицберген ',
    'Скалы Мохер',
    'Фьорды',
    'Этрета',
    'Неаполитания',
    'Нормандия',
    'Сицилия',
    'Седжеста',
    'Агридженто',
    'Сиракузы',
    'Римская вилла',
    'Хевиз',
    'Метеора',
    'Крит',
    'Санторини',
    'Сардиния',
    'Дорога Гигантов',
    'Понта-де-Пьедаде',
    'Мыс Рока',
    'Кафедральные Соборы',
    'Шотландия',
    'Плитвицкие озёра',
    'Нойшванштайн',
    'Замки Луары',
    'Венеция',
    'Прекестулен',
    'Лапландия',
    'Алечский ледник',
    'Троллтунг',
    'Блед',
    'Сан-Джиминьяно',
    'Прованс',
    'Чинкве-терре',
    'Кёкенхоф',
    'Гейрангер-фьорд',
    'Бонифачо',
    'Монастыри Метеоры',
    'Халлербос',
    'Монте-Карло',
    'Хальштатт',
    'Дайвинг',
    'Серфинг',
    'Охота',
    'Рыбалка',
    'Сафари',
    'Велотуризм',
    'Маунтинбайк',
    'воздушные шары',
    'Горный спорт',
    'Коньки',
    'Конный спорт',
    'Каякинг ',
    'рафтинг',
    'Парусный спорт',
    'Спелеотуризм',
    'Скейтбординг',
    'Гольф',
    'Походы',
    'Геокэшинг',
    'Раскопки',
    'Пейнтбол',
    'Ринго',
    'Скалодром',
    'Батуты',
    'Боулинг',
    'Бильярд',
    'Квест',
    'Страйкбол',
    'Плавание',
    'Парашют',
    'Тир',
    'Велосипед',
    'Картинг',
    'Автоспорт',
    'Альпинизм',
    'Прогулки по лесу',
    'Сбор ягод ',
    'Сбор грибов',
    'Пешие прогулки',
    'Сады',
    'Музеи',
    'Парки',
    'Галереи',
    'Квадроцикл',
    'Псахо ретрит',
    'Лыжи',
    'Снегоходы',
    'Сноуборд',
    'Лошади',
    'Тропические',
    'Арктические',
    'для знакомств',
    'Кулинарные',
    'Тематические',
    'Детективные',
    'Спортивные',
    'гулет',
    'Трудовые',
    'Средиземноморские',
    'Кругосветные',
    'Прибрежные',
    'Трансатлантические',
    'Экспедиционные',
    'Свадебные',
    'Семейные',
    'Морские',
    'Речные',
    'Поезд',
    'Лайнер',
    'Стандарт ',
    'Премиум ',
    'Люкс',
    'Краткосрочные',
    'Среднесрочные',
    'Долгосрочные ',
    'Экономичные ',
    'Стандартные',
    'Паннонское море',
    'Адриатическое море',
    'Азовское море',
    'Аки-Нада',
    'Аландское море',
    'Альборан ',
    'Амундсена',
    'Андаманское море',
    'Аравийское море',
    'Арафурское море',
    'Аргентинское море',
    'Балеарское море',
    'Бали',
    'Балтийское море',
    'Банда',
    'Баренцево море',
    'Баффина',
    'Беллинсгаузена',
    'Белое море',
    'Бенгальский залив',
    'Берингово море',
    'Бофорта',
    'МакКинли',
    'Море Ванделя',
    'Ваттовое море',
    'Висаян',
    'Японское море',
    'Восточно-Китайское море',
    'Восточно-Сибирское море',
    'Гебридское море',
    'Гренландское море',
    'Гудзонов залив',
    'Море Густава-Адольфа',
    'Море Дейвиса',
    'Море Дюрвиля',
    'Жёлтое море',
    'Икарийское море',
    'Ионическое море',
    'Ирландское море',
    'Море Ирмингера',
    'Ируаз',
    'Камотес',
    'Карибское море',
    'Карское море',
    'Кейн',
    'Кельтское море',
    'Бассейн Кейна',
    'Кипрское море',
    'Коралловое море',
    'Коро ',
    'Море Короля Хокона VII',
    'Море Космонавтов',
    'Красное море',
    'Критское море',
    'Лабрадор ',
    'Море Лазарева',
    'Лаккадивское море',
    'Море Лаптевых',
    'Левантийское море',
    'Ливийское море',
    'Лигурийское море',
    'Море Линкольна',
    'Мексиканский залив',
    'Минданао ',
    'Миртойское море',
    'Молуккское море',
    'Море Моусона',
    'Мраморное море',
    'Новогвинейское море',
    'Норвежское море',
    'Охотское море',
    'Персидский залив',
    'Печорское море',
    'Море Рисер-Ларсен',
    'Море Росса',
    'Саву',
    'Самар',
    'Саргассово море',
    'Северное море',
    'Селиш',
    'Серам ',
    'Сибуян ',
    'Скоша',
    'Море Содружества',
    'Соломоново море',
    'Море Сомова',
    'Средиземное море',
    'Сулавеси',
    'Сулу ',
    'Тасманово море',
    'Тиморское море',
    'Тирренское море',
    'Море Уэдделла',
    'Фиджи',
    'Филиппинское море',
    'Флорес ',
    'Фракийское море',
    'Хальмахера ',
    'Харима-Нада',
    'Чёрное море',
    'Чукотское море',
    'Шантарское море',
    'Эгейское море',
    'Южно-Китайское море',
    'Яванское море',
    'Внутреннее Японское море',
    'Атлантический океан',
    'Индийский океан',
    'Тихий океан',
    'Северный Ледовитый океан',
    'Азия',
    'с попутчиками',
    'с друзьями',
    'в одиночку',
    'с семьей',
    'с супругом/супругой',
    'Каршеринг ',
    'На своей машине',
    'Горы',
    'Моря',
    'Европа',
    'Краснодарский край',
    'Байкал',
    'Калмыкия',
    'Адыгея',
    'Золотое кольцо',
    'Кавказ',
    'Урал',
    'Шотландия ',
    'Альпинизм ',
    'Горный туризм',
    'Дайвинг ',
    'Джиппинг ',
    'Рафтинг ',
    'Автостоп ',
    'Роуп – джампинг ',
    'Кайтсерфинг',
    'Джайлоо-туризм',
    'Парашютизм',
    'Воздушный шар',
    'Сталкерство',
    'Индастриал',
    'Диггерство',
    'Вейкбординг',
    'Водные лыжи ',
    'Виндсерфинг ',
    'Маунтинбайкинг ',
    'Спелеология',
    'Спелестология',
    'X-гонки',
    'Сноубординг',
    'Горные лыжи',
    'Скайсерфинг ',
    'Космический туризм',
    'Драгстеры',
    'Гели-скиинг',
    'Сэндбординг',
    'Плаванье с акулами',
    'Забег с быками',
    'Чернобыль',
    'Плавание с крокодилами',
    'Банджи-джампинг',
    'Джунгли',
    'Охота на торнадо',
    'Горячие точки',
    'Трущобы',
    'Зоны отчуждения',
    'Капсульные отели',
    'Шале',
    'Апартаменты',
    'Миниатюрные дома',
    'Риад',
    'Ботели',
    'Отели',
    'Хостелы',
    'Кемпинг',
    'Хаусситтинг',
    'Палатка',
    'Каучсерфинг',
    'Сквоттинг',
    'Транспорт',
    '«Одна звезда»',
    '«Две звезды» ',
    '«Три звезды» ',
    '«Четыре звезды»',
    '«Пять звёзд»',
    'Отели-курорты',
    'Бутик-отели',
    'Мини-гостиницы',
    'Мотель',
    'Гостевые дома',
    'СПА-отели',
    'Лоджи',
    'Пансионаты ',
    'Санатории',
    'Эко-отели',
    'Флотель ',
    'Флайтель',
    'Отель-Алькаса',
    'Поусада',
    'Бюджетное',
    'Среднее',
    'Вилла',
    'Съемное жилье',
    'Студия',
    'музеи 🛕',
    'исторические',
    'Тематические ',
    'Искусствоведческие ',
    'Литератульные',
    'Архитектурные',
    'С гидом',
    'Самостоятельно',
    'Обзорные',
    'Экологические',
    'Пешие',
    'Автобусные',
    'Достопримечательности',
    'Исторические места',
    'Миконос',
    'Айя-Напа',
    'Сен-Тропе',
    'Паттайя',
    'Римини',
    'Льорет-де-Мар',
    'Бодрум',
    'Иос',
    'Сент-Люсия',
    'Бичкомбер',
    'Флорианополис',
    'Хвар',
    'Барбадос',
    'Аруба',
    'Ко Панган',
    'Будапешт',
    'Марбелья',
    'Новаля',
    'Мамая',
    'Октоберфест',
    'Амстердам',
    'Рейкьявик',
    'Ко-Панган',
    'Паг',
    'Римини-Риччоне',
    'Майами',
    'Happy End',
    '«Заварка»',
    'Kisa Bar',
    'Secret Room',
    '«Сикрет»',
    'Stereo People',
    '«Квартира»',
    'Bassani',
    'Berghain',
    'Concrete',
    'Contact',
    'DC ',
    'DE School',
    'Faust',
    'Goa',
    'Kaiku',
    'Lux Fragil',
    'Macarena',
    'Nowadays',
    'Closer',
    'Opium',
    'Phonox',
    'Robert Johnson',
    'Salon Des Amateurs',
    'Smartbar',
    'Sub Club',
    'Warung Beach Club',
    'Золотые пески',
    'Кранево',
    'Албена',
    'Солнечный Берег ',
    'Барселона',
    'Ллорет де Мар',
    'Майорка',
    'Бенидорм',
    'Салоу',
    'Алушта',
    'Мармарис',
    'Кемер',
    'Анталия',
    'Крит Ретимно',
    'Родос',
    'Тайланд 🇹🇭',
    'Пхукет',
    'Мальта',
    'Сент-Джулианс ',
    'Римини-Риччоне ',
    'Северный гоа',
    'Валаам ',
    'п. Соловецкий',
    'с. Дивеево',
    'Иерусалим ',
    'Афон',
    'Собор Парижской Богоматери ',
    'Базилика Святого Иерусалимского Креста',
    'Собор Иоанна Предтечи',
    'Базилика Святой Крови',
    'Мекка',
    'Лумбини',
    'Бодх-Гая',
    'Сарнатх',
    'Кушинагар',
    'Иволгинский дацан',
    'Бурятия',
    'Медина',
    'Вьетнам',
    'Таиланд',
    'Назарет',
    'Верхотурье',
    'Псково-Печерская Лавра',
    'Беларусь 🇧🇾',
    'Ватикан',
    'Турин',
    'Тибет ',
    'Лурд',
    'Фатима',
    'Брюгг',
    'Стамбул',
    'Ташкент',
    'Самарканд',
    'Бухара',
    'Рухабад',
    'Биби-Ханум',
    'Регистана',
    'Адна зямля',
    'Аксёнов-фест',
    'Алма-Ата — моя первая любовь',
    'Альдебургский фестиваль',
    'Альтамонт ',
    'Антифабрика',
    'Астана аркау',
    'Байкал-Шаман',
    'Байрёйтский фестиваль',
    'Бакинский джазовый фестиваль',
    'Международный фестиваль Мстислава Ростроповича',
    'Балтийский праздник песни и танца',
    'Бархатное подполье',
    'Басовище',
    'Бат',
    'Безумный день ',
    'Беломор-Буги',
    'Белые ночи Санкт-Петербурга',
    'Боннару',
    'Бэйганский музыкальный фестиваль',
    'Варшавская осень',
    'Вечная весна',
    'Виват, Россия!',
    'Виръял шевлисем',
    'Воздух',
    'ВолгаФест',
    'Вольнае паветра',
    'Всемирные хоровые игры',
    'Вудсток ',
    'Габалинский музыкальный фестиваль',
    'Гарсингтонская опера',
    'Национальный фольклорный фестиваль',
    'Глайндборнский оперный фестиваль',
    'Гластонбери ',
    'Голос кочевников',
    'Грушинский фестиваль',
    'ГЭС',
    'Даждь',
    'Дармштадтский фестиваль',
    'Дачный фестиваль им. Шаляпина',
    'Джаз в саду Эрмитаж',
    'Джаз Коктебель',
    'Джаз Мэй',
    'Джаз на Днепре',
    'Джазовая провинция',
    'Джазовый фестиваль ',
    'Джазовый фестиваль в Монтрё',
    'Дикая мята',
    'Дискотека 80-х',
    'Дни белорусской и шведской поэзии',
    'Доброфест',
    'Дунайская Сечь',
    'Евровидение',
    'Ереван-81',
    'Жара ',
    'Живой ',
    'Звоны Софии',
    'Земляки ',
    'Знаменка ',
    'Золотой граммофон',
    'Золотой Орфей',
    'Золотой шлягер ',
    'Ильменский фестиваль',
    'Инсбрукский фестиваль старинной музыки',
    'Интервидение ',
    'Каменица',
    'Кантаджиро',
    'КиевМузикФест',
    'КИНО сначала',
    'Коачелла ',
    'Конкордия',
    'Країна Мрій',
    'Красная гвоздика ',
    'Круг Света',
    'Крылья',
    'Легенды «Ретро FM»',
    'Летний фестиваль в Квебеке',
    'Лётчикфест',
    'Люцернский фестиваль',
    'Максидром',
    'Мамакабо',
    'Марафон памяти Василия Слипака',
    'Мастер-джем-фест',
    'Мастера Музыки',
    'Масторавань морот',
    'Международный майский фестиваль',
    'Музыкальный фестиваль им. Узеира Гаджибекова',
    'оперный фестиваль имени М. Д. Михайлова',
    'оперный фестиваль имени Ф. И. Шаляпина',
    'Стамбульский джазовый фестиваль',
    'фестиваль барочной музыки в Валлетте',
    'фестиваль искусств имени Сахарова',
    'фестиваль популярной музыки',
    'фестиваль современной музыки им. Кара Караева',
    'фестиваль танца в Куопио',
    'Музыкальный фестиваль в Ментоне',
    'Метафест',
    'Микрофон ',
    'Мир гитары',
    'Мир Мугама',
    'Мир Сибири',
    'Монстры рока',
    'Морской узел',
    'Московский Пасхальный фестиваль',
    'Мотоярославец',
    'Мугам 2005',
    'Мугам 2007',
    'Музыкальные вечера Осора',
    'Музыкальные сезоны',
    'фестиваль в Грант-парке',
    'фестиваль Вербье',
    'Музыканты за мир',
    'Музэнерго',
    'Мюнхенский оперный фестиваль',
    'Национальный мультикультурный фестиваль',
    'Нашествие',
    'Новая звезда ',
    'Одна восьмая',
    'Окна открой!',
    'Омладинский фестиваль',
    'Опера — всем',
    'Оперный фестиваль в Лонгборо',
    'Оперный фестиваль Россини',
    'Оскольская лира',
    'Парад любви',
    'The 100 Club Festival',
    'Песня года',
    'Петроджаз',
    'Печенежское поле ',
    'Пикник «Афиши»',
    'Пиратская станция',
    'Поволжские сезоны Александра Васильева',
    'Погода',
    'Польский Вудсток',
    'Пражская весна ',
    'Премьеры сезона ',
    'ПромФест',
    'Пустые холмы',
    'Пятое поколение ',
    'Рахлинские сезоны',
    'Республика КаZантип',
    'Ридду Ридду',
    'Родники России',
    'Рождественские встречи',
    'Рожен ',
    'Рок над Волгой',
    'Рок против террора',
    'Рок-кола',
    'Рок-н-ролл Таврический',
    'Российские звёзды мирового джаза',
    'оперный фестиваль в Савонлинна',
    'Фестиваль в Сан-Ремо',
    'Сантандерский международный фестиваль',
    'Свинг белой ночи',
    'Сигет ',
    'Славянский базар',
    'Славянский рок ',
    'Собиновский фестиваль',
    'Созвездие-Йолдызлык',
    'фестиваль песни в Сопоте',
    'Соседний мир',
    'Сотворение мира ',
    'Lollapalooza',
    'Стамбульский музыкальный фестиваль',
    'Старые плуги',
    'Старый новый рок',
    'Стокгольмский фестиваль старинной музыки',
    'Субботник ',
    'Суховей ',
    'Сходы до Неба',
    'Таврийские игры',
    'Тарас Бульба',
    'Топос ',
    'Три века классического романса ',
    'Триумф джаза',
    'Улетай',
    'Усадьба Jazz',
    'Учитесь плавать',
    'Уэксфордский оперный фестиваль',
    'Фестивали песни АВС',
    'Фестивали Рединг и Лидс',
    'Фестиваль барочной музыки в Амброне',
    'Фестиваль в Монтерее',
    'Фестиваль Глиммерглас',
    'Фестиваль классического балета имени Рудольфа Нуриева',
    'Фестиваль Пуччини',
    'Фестиваль Северной Норвегии',
    'Фестивальбар',
    'Флорентийский музыкальный май',
    'Фортеця ',
    'Франкофоли де Монреаль',
    'Царь-Джаз',
    'Цех',
    'Чебоксарский балетный фестиваль',
    'Чемпионат мира по караоке',
    'Червона рута ',
    'Чернозём',
    'Шарк Тароналари',
    'Шубертиада',
    'Alfa Future People',
    'Geek Picnic',
    'Алые паруса',
    'О, да! Еда!',
    'Архстояние',
    'День Бородина',
    'День вулкана',
    'Faces&Laces',
    'VK Fest',
    'Октоберфест ',
    'Ochsenbraterei ',
    'Диа де лос Муэртос',
    'Dia de los Muertos ',
    'Фестиваль света',
    'Инти Райми ',
    'Юаньсяоцзе ',
    'Ап Хелли Аа',
    'Up Helly Aa',
    'Холи',
    'краски Холи',
    'Венецианский карнавал',
    'Ла Томатина ',
    'Burning Man',
    'Фестиваль снега и льда',
    'Китайский Новый год',
    'Кинофестиваль Сандэнс',
    'Магх Мела',
    'Фонарики',
    'парящие зонтики',
    'Merfest',
    'Яично-мучной праздник',
    'Томатина ',
    'Эль Сальто-дель-Колачо',
    'прыжок дьявола',
    'International Highline Meeting',
    'Снежный фестиваль',
    'Фестиваль слонов',
    'Фестиваль тигров',
    'День мертвых',
    'Фальяс ',
    'Хамамацу',
    'Фестиваль грязи',
    'Сонгкран ',
    'Обезьяний банкет',
    'Пустынный фестиваль',
    'Фестиваль винограда',
    'Синулог ',
    'Война ракет',
    'Подводный музыкальный фестиваль',
    'Фестиваль Солнца',
    'Кукер',
    'Святки',
    'Бразильский карнавал',
    'талассотерапия',
    'Бальнеотерапия ',
    'Фанкотерапия ',
    'Альготерапия ',
    'Бальнеология',
    'Климатолечение',
    'Аэротерапия ',
    'Гелиотерапия ',
    'Китайская медицина',
    'Аюрведа',
    'Грязелечение',
    'Заграницей',
    'Пансионаты',
    'СПА-программы',
    'Мёртвое море',
    'Боржоми ',
    'Монтекатини-Терме',
    'Купальня Сечени',
    'Белокуриха ',
    'Карловы Вары',
    'Величка ',
    'Хаммамет ',
    'Термотерапия',
    'Питьевая терапия',
    'Кнейп-терапия',
    'Холистическая терапия',
    'Радоновая терапия',
    'Серная терапия',
    'Лечение спины',
    'Аэрозольная терапия',
    'Гидротерапия',
    'Кислородная терапия',
    'Мацестинский курорт',
    'Ессентуки',
    'Тинакская грязелечебница',
    'Озеро Эльтон',
    'Мацеста',
    'Горячий ключ',
    'Дус-Холль',
    'Чедер',
    'Кисловодск',
    'Баскунчак',
    'Катунь',
    'Алтай West',
    'Дружба',
    'Золотой берег',
    'Санаторий имени Н.К. Крупской',
    'Мечта',
    'Орен Крым',
    'Родник',
    'Дон',
    'Машук',
    'Лермонтово',
    'Тарханы',
    'санаторий им. Кирова',
    'Заря',
    'Ставрополье',
    'Зори',
    'Поляна',
    'Руно',
    'Сечени ',
    'Франтишкови-Лазне',
    'Бад-Ишль',
    'Баден',
    'Константинови-Лазне',
    'Рогашка Слатина',
    'Фьюджи',
    'Пиештяны',
    'Виши',
    'Друскининкай ',
    'Мертвое море',
    'Юрмала ',
    'Кудова-Здруй ',
    'Нафталан ',
    'Харкань ',
    'Марианские Лазне ',
    'Пиештяны ',
    'Рогашка Слатина ',
  ];

  List<String> getTravellingInterests() => _travellingInterests;
}
