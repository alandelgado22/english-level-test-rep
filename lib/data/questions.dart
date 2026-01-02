import '../models/question.dart';

List<Question> questions = [
  //1
  Question(
  text: 'A: (1) your brother?\nB: Yes, (2) . His name is Alexander. (3) high school teacher. His wife (4) a boutique downtown. They (5) two children—a boy and a girl.',
  items: ['1.', '2.', '3.', '4.', '5.'],
  gridOptions: [
    'a. That\'s', 'b. He\'s', 'c. Is that', 'd. Are that', 'e. They are',
    'a. he\'s',   'b. that\'s', 'c. is',      'd. it is',    'e. brother',
    'a. He\'s',		'b. She\'s',		'c. That is a',		'd. Is he',		'e. He\'s a',
    'a. has',		'b. is',		'c. have',		'd. are',		'e. am',
    'a. is',		'b. have',		'c. am',		'd. are',		'e. have',
    // ... continue for all 25 options
  ],
  correctAnswers: ['c', 'd', 'e', 'a', 'b'],
  topics: null, 
),
//2
Question(
  text: 'A: (6) Henry work with you?\nB: No, (7). (8) an office on Main Street. (9) him?\nA: Yes. His daughter (10) Spanish with my son.\n',
  items: ['6.', '7.', '8.', '9.', '10.'],
  gridOptions: [
    'a. Does',		'b. Is',		'c. Do',		'd. Are',		'e. Can',
    'a. he does',	'b. does he',	'c. he doesn\'t', 'd. doesn\'t he', 'e. he isn\'t',
    'a. He hasn\'t',	'b. He does',	'c. He have',	'd. He has',	'e. He doesn\'t has',
    'a. Does he know',	'b. Are you',	'c. Do you knows',	'd. Do he know',	'e. Do you know',
    'a. studies',	'b. is studying',	'c. does study',	'd. study',	'e. not study',
    // ... continue for all 25 options
  ],
  correctAnswers: ['a', 'c', 'd', 'e', 'a'],
  topics: null, 
  isGridFormat: true,
),
//3
Question(
  text: 'A: Excuse me. (11) a furniture store near here?\nB: Yes. Martins (12) great furniture. They (13) a sale right now.\nA: And a bank?\nB: No, (14) any banks around here. \nA: Are you new here?\nB: Yes, (15) in today.',
  items: ['11.', '12.', '13.', '14.', '15.'],
  gridOptions: [
    'a. Is',	'b. There’s',	'c. There isn’t',	'd. Is there',	'e. Is it',
    'a. is',	'b. is having',	'c. is has',	'd. is have',	'e. has',
    'a. have',	'b. are having',	'c. has',	'd. is have',	'e. are have',
    'a. there is',	'b. there are',	'c. there aren’t',	'd. there isn’t',	'e. it isn’t',
    'a. I move',	'b. I am move',	'c. I’m move',	'd. I moves',	'e. I’m moving',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'e', 'c', 'e', 'e'],
  topics: null, 
  isGridFormat: true,
),
//4
Question(
  text: 'A: (16) your friend arrive from Paris?\nB: Yes, she (17). Her flight (18) late.\nA: (19) to meet her.\nB: She (20) to visit her mother. We can visit her tomorrow.',
  items: ['16.', '17.', '18.', '19.', '20.'],
  gridOptions: [
    'a. Does',	'b. Did',	'c. Are',	'd. Do',	'e. Was',
    'a. do',	'b. does',	'c. was',	'd. did',	'e. were',
    'a. is',	'b. are',	'c. did',	'd. were',	'e. was',
    'a. I like',	'b. I liked',	'c. I’d liked',	'd. I’d like',	'e. I was like',
    'a. went',	'b. goed',	'c. liked',	'd. goes',	'e. is going',
    // ... continue for all 25 options
  ],
  correctAnswers: ['b', 'd', 'e', 'd', 'e'],
  topics: null, 
  isGridFormat: true,
),
//5
Question(
  text: 'A: Mary, do we have (21) soft drinks?\nB: Yes, there are (22) in the refrigerator. You (23) drink soft drinks all day. How (24) do you drink?\nA: Two or three bottles. \nB: You (25) drink water. It’s better for you.',
  items: ['21.', '22.', '23.', '24.', '25.'],
  gridOptions: [
    'a. any',	'b. a',	'c. an',	'd. no',	'e. the',
    'a. them',	'b. an',	'c. any',	'd. some',	'e. they',
    'a. should',	'b. don’t',	'c. can',	'd. aren’t',	'e. shouldn’t',
    'a. drinks',	'b. much',	'c. any',	'd. many',	'e. soft',
    'a. don’t',	'b. should',	'c. isn’t',	'd. can’t',	'e. shouldn’t',
    // ... continue for all 25 options
  ],
  correctAnswers: ['a', 'd', 'a', 'b', 'b'],
  topics: null, 
  isGridFormat: true,
),
//6
Question(
  text: 'A: Where (26) your boyfriend?\nB: (27) at a dance club. \nA: What (28)?\nB: I (29) a drink and he (30) me to dance.',
  items: ['26.', '27.', '28.', '29.', '30.'],
  gridOptions: [
    'a. were you meeting',	'b. do you know',	'c. did you know',	'd. are you meeting',	'e. did you meet',
    'a. We meet',	'b. We knew',	'c. We met',	'd. We were meeting',	'e. We’re meeting',
    'a. were you doing',	'b. did you do',	'c. do you do',	'd. was he doing',	'e. does he do',
    'a. having',	'b. am having',	'c. was having',	'd. had',	'e. were having',
    'a. was asking',	'b. asking',	'c. asked',	'd. were asking',	'e. ask',
    // ... continue for all 25 options
  ],
  correctAnswers: ['e', 'c', 'a', 'c', 'c'],
  topics: null, 
  isGridFormat: true,
),
//7
Question(
  text: 'A: (31) a famous person?\nB: Yes, I (32) Brad Pitt (33). What about you?\nA: (34) Tom Cruise for five years. Our children (35) to the same school when they were younger.',
  items: ['31.', '32.', '33.', '34.', '35.'],
  gridOptions: [
    'a. Did you meet',	'b. Have you ever met',	'c. Have you meet',	'd. Did ever you meet',	'e. Has you met',
    'a. have met',	'b. know',	'c. met',	'd. have know',	'e. already met',
    'a. last two years',	'b. tomorrow',	'c. two last years',	'd. two years ago',	'e. for two years',
    'a. I know',	'b. I knew',	'c. I am knowing',	'd. I’ve knew',	'e. I’ve known',
    'a. have gone',	'b. went',	'c. go',	'd. are going',	'e. have went',
    // ... continue for all 25 options
  ],
  correctAnswers: ['b', 'c', 'a', 'e', 'b'],
  topics: null, 
  isGridFormat: true,
),
//8
Question(
  text: 'A: I’m having a bad day.\nB: Why? What’s happened?\nA: Well, I don’t know (36) and I have no idea what (37) with my jacket.\nB: That’s too bad.\nA: That’s just the beginning. We (38) that report before Friday and we haven’t started.\nB: Well, you (39) relax. You (40) worry about the report. I finished it last night.',
  items: ['36.', '37.', '38.', '39.', '40.'],
  gridOptions: [
    'a. where’s my dog',	'b. where my dog',	'c. what’s my dog',	'd. where my dog is',	'e. what my dog is',
    'a. Bob did',	'b. did Bob do',	'c. has Bob done',	'd. Bob does',	'e. Bob is done',
    'a. have finished',	'b. needed finish',	'c. shouldn’t finish',	'd. can finished',	'e. need to finish',
    'a. have to',	'b. can',	'c. shouldn’t',	'd. can’t',	'e. need',
    'a. should',	'b. don’t have to',	'c. need to',	'd. can',	'e. can’t',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'b', 'e', 'a', 'b'],
  topics: null, 
  isGridFormat: true,
),
//9
Question(
  text: 'A: Did your brother (41) professional soccer?\nB: Yes, you met him last Christmas, (42)?\nA: Yes, he was very nice. My son (43) autographs, but he never got your brother’s. He’ll visit you again next Christmas, (44)?\nB: Sure. Bring your son over to the house. He’s still living at home, (45)?\nA: Yes, he goes to college downtown.',
  items: ['41.', '42.', '43.', '44.', '45.'],
  gridOptions: [
    'a. used to play',	'b. played',	'c. playing',	'd. use to play',	'e. plays',
    'a. you did',	'b. no',	'c. you didn’t',	'd. did you',	'e. didn’t you',
    'a. used to collect',	'b. collects',	'c. was collected',	'd. collect',	'e. is collecting',
    'a. is he',	'b. he does',	'c. will he',	'd. won’t he',	'e. doesn’t he',
    'a. isn’t he',	'b. does he',	'c. no',	'd. is he',	'e. he is',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'e', 'a', 'd', 'a'],
  topics: null, 
  isGridFormat: true,
),
//10
Question(
  text: 'My brothers (46) at the beach since June. They (47) near the ocean. (48) of them knows how to swim. If they (49) how to swim soon, (50) working at the swimming pool.',
  items: ['46.', '47.', '48.', '49.', '50.'],
  gridOptions: [
    'a. have working',	'b. are working',	'c. have been working',	'd. worked',	'e. have worked',
    'a. have worked',	'b. haven’t been working',	'c. work',	'd. didn’t work',	'e. worked',
    'a. Both',	'b. Some',	'c. Either',	'd. Any',	'e. Neither',
    'a. learn',	'b. learning',	'c. have learned',	'd. do learns',	'e. does learn',
    'a. they start',	'b. they started',	'c. they’d start',	'd. they’ll start',	'e. they’re starting',
    // ... continue for all 25 options
  ],
  correctAnswers: ['c', 'c', 'e', 'a', 'd'],
  topics: null, 
  isGridFormat: true,
),
//11
Question(
  text: 'A: Did you talk to Mr. Lancaster?\nB: Yes. He told (51) early tomorrow. He asked me where (52) and he asked me (53) to you.\nA: Does he want (54) to New York or will he (55) here?\nB: He didn’t say.',
  items: ['51.', '52.', '53.', '54.', '55.'],
  gridOptions: [
    'a. that I come',	'b. me to come',	'c. that me come',	'd. to me come',	'e. come to me',
    'a. is the Apex file',	'b. the Apex file is',	'c. was the Apex file',	'd. goes the Apex file',	'e. the Apex file was',
    'a. I talk',	'b. I talked',	'c. if I had talking',	'd. if I had talked',	'e. if I had talk',
    'a. you to go',	'b. to you go',	'c. you go',	'd. that you go',	'e. that go you',
    'a. let you to stay',	'b. to let you stay',	'c. make you to stay',	'd. let you stay',	'e. let that you stay',
    // ... continue for all 25 options
  ],
  correctAnswers: ['a', 'b', 'd', 'a', 'd'],
  topics: null, 
  isGridFormat: true,
),
//12
Question(
  text: 'I had a bad trip. There were a lot of people at the airport and everything was so slow. By the time I got through security, the plane (56). I talked to the agent at the desk and she said there (57) another flight to New York until tomorrow. I told her I (58) a meeting in the evening. She said she (59) me, but she said I should talk to American Airlines. I got to New York very late and when I finally got to the office, the meeting (60). ',
  items: ['56.', '57.', '58.', '59.', '60.'],
  gridOptions: [
    'a. is leaving',	'b. will leave',	'c. had left',	'd. left',	'e. has left',
    'a. isn’t going to be',	'b. will be',	'c. wouldn’t be',	'd. would be',	'e. was',
    'a. will have',	'b. had had',	'c. am having',	'd. can have',	'e. had',
    'a. couldn’t help',	'b. helped',	'c. can help',	'd. had helped',	'e. can’t help',
    'a. has started',	'b. should started',	'c. had started',	'd. starts',	'e. started',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'b', 'e', 'a', 'e'],
  topics: null, 
  isGridFormat: true,
),
//13
Question(
  text: 'I didn’t get the job. If I (61) what the interview was like, I (62) myself more. If I (63) the company, I (64) some logical questions and I (65) to give more intelligent answers. I (66) more confident if I (67) more time to prepare. Now I (68) for another job.',
  items: ['61.', '62.', '63.', '64.', '65.'],
  gridOptions: [
    'a. knew',	'b. will know',	'c. would known',	'd. had known',	'e. have known',
    'a. had prepared',	'b. prepared',	'c. will prepare',	'd. would’ve prepared',	'e. prepare',
    'a. investigate',	'b. had investigated',	'c. would investigate',	'd. investigated',	'e. have investigated',
    'a. prepared',	'b. could’ve prepared',	'c. had prepared',	'd. prepare',	'e. would prepare',
    'a. might could',	'b. might have',	'c. had been able',	'd. might’ve been able',	'e. had been',
    // ... continue for all 25 options
  ],
  correctAnswers: ['a', 'a', 'e', 'a', 'd'],
  topics: null, 
  isGridFormat: true,
),
//14
Question(
  text: 'Recently it (66) that J. K. Rowling is richer than the Queen of England. Rowling’s Harry Potter books (67) into more than 20 languages. The sixth volume of the series (68) by eager fans when Ms. Rowling (69) by our reporter. Surprisingly, the first volume of the series (70) down by many publishers before she was finally able to publish it.',
  items: ['66.', '67.', '68.', '69.', '70.'],
  gridOptions: [
    'a. is announcing',	'b. announced',	'c. has announced',	'd. is announced',	'e. was announced',
    'a. did translate',	'b. have translated',	'c. was translated',	'd. have been translated',	'e. are translated',
    'a. is awaited',	'b. was being awaited',	'c. is being awaited',	'd. is awaiting',	'e. has been awaiting',
    'a. is interviewing',	'b. interviewed',	'c. is interviewed',	'd. was interviewing',	'e. was interviewed',
    'a. turned',	'b. had been turned',	'c. has been turned',	'd. is turned',	'e. had turned',
    // ... continue for all 25 options
  ],
  correctAnswers: ['e', 'c', 'e', 'e', 'a'],
  topics: null, 
  isGridFormat: true,
),

//15
Question(
  text: 'Let me (71) I’m worried about the environment. No one seems to care. (72) the most is what we’ll do with so much garbage. So much more (73). Households that produce a lot of garbage (74) more, and so many plastic bags (75) at the supermarkets.',
  items: ['71.', '72.', '73.', '74.', '75.'],
  gridOptions: [
    'a. tell you',	'b. say you why',	'c. tell why',	'd. tell you why',	'e. tell to you',
    'a. That worries me',	'b. I worry',	'c. That I worry',	'd. Why I worry',	'e. What worries me',
    'a. was done',	'b. could be done',	'c. could have done',	'd. could do',	'e. has been done',
    'a. should be taxed',	'b. should tax',	'c. shouldn’t taxed',	'd. have been taxed',	'e. are taxed',
    'a. are used',	'b. were use',	'c. shouldn’t be used',	'd. used',	'e. should use',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'e', 'd', 'e', 'a'],
  topics: null, 
  isGridFormat: true,
),
//16
Question(
  text: 'By 2100, the world’s population (76) 10 billion. We (77) in extremely large cities and breathing very contaminated air. Most homes (78) large air filtering systems. All wild animals (79) and children (80) the zoos to see the last living lions and chimpanzees.',
  items: ['76.', '77.', '78.', '79.', '80.'],
  gridOptions: [
    'a. will reach',	'b. will have reached',	'c. will be reached',	'd. has reached',	'e. will reaching',
    'a. will be living',	'b. will living',	'c. will have lived',	'd. live',	'e. will be lived',
    'a. will be installed',	'b. will installed',	'c. have installed',	'd. will have installed',	'e. be installing',
    'a. are disappearing',	'b. are disappeared',	'c. disappear',	'd. will have disappeared',	'e. have disappear',
    'a. are visiting',	'b. will be visiting',	'c. have visited',	'd. visit',	'e. will be visited',
    // ... continue for all 25 options
  ],
  correctAnswers: ['b', 'a', 'd', 'd', 'a'],
  topics: null, 
  isGridFormat: true,
),
//17
Question(
  text: 'Bob: Hi, Steve. Have you called Amy?\nSteve: I’ll call her tomorrow. I’ll ask her to meet me here at my house. \nBob: Are you coming to the theater with us next Wednesday?\nSteve: I’m not sure. I might have an exam next Thursday.\n\nThree weeks later:\nAmy: Have you seen Steve?\nBob: Yes, a couple of weeks ago. He said he’d call you (81). He told me he was going to ask you to meet him (82), at (83) house. He also said he would go to the theater with us (83). He never showed up, but he did tell me he might have an exam (85).',
  items: ['76.', '77.', '78.', '79.', '80.'],
  gridOptions: [
    'a. tomorrow',	'b. then',	'c. last week',	'd. the next day',	'e. yesterday',
    'a. where',	'b. then',	'c. here',	'd. later',	'e. there',
    'a. your',	'b. my',	'c. their',	'd. her',	'e. his',
    'a. next Wednesday',	'b. Wednesday',	'c. last Wednesday',	'd. the following Wednesday',	'e. tomorrow',
    'a. last Thursday',	'b. next Thursday',	'c. Thursday',	'd. the day before',	'e. the day after',
    // ... continue for all 25 options
  ],
  correctAnswers: ['b', 'c', 'e', 'a', 'b'],
  topics: null, 
  isGridFormat: true,
),
//18
Question(
  text: 'Andrew (86) live in Africa when he was a child. He loved it there. He (87) get up early and climb a tree near the watering hole. He (88) spend hours there looking at the wildlife. He would love to live there again, but he told me he wouldn’t go back (89) he had enough money to buy a house there. (90) he can return someday, he promised to invite me to visit him there.',
  items: ['86.', '87.', '88.', '89.', '90.'],
  gridOptions: [
    'a. do',	'b. use to',	'c. would',	'd. used to',	'e. could',
    'a. would',	'b. did',	'c. liked',	'd. use to',	'e. should',
    'a. use to',	'b. didn’t',	'c. would',	'd. must have',	'e. wouldn’t',
    'a. however',	'b. unless',	'c. rather',	'd. in case',	'e. providing',
    'a. Unless',	'b. Only if',	'c. So long',	'd. In cases where',	'e. In the event',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'b', 'c', 'b', 'a'],
  topics: null, 
  isGridFormat: true,
),
//19
Question(
  text: 'Sandy,I’m leaving you this note because of a problem that happened (91) you were out of town. The copy machine broke down again. I (92) at it, but he said he couldn’t fix it. He said we have to (93) the factory. (94), he offered to lend us another machine until we get ours back. He gave us an old machine, but (95) it makes a lot of noise, it seems to work all right.',
  items: ['91.', '92.', '93.', '94.', '95.'],
  gridOptions: [
    'a. after',	'b. while',	'c. before',	'd. although',	'e. until',
    'a. had Ed looked',	'b. had Ed look',	'c. Ed looked',	'd. got Ed look',	'e. look Ed at it',
    'a. had the factory',	'b. have it by',	'c. have it checked by',	'd. check by',	'e. get checked by',
    'a. Although',	'b. Through',	'c. Instead of',	'd. Whereas',	'e. However',
    'a. contrary to',	'b. in spite of the fact',	'c. wherever',	'd. because',	'e. for this reason',
    // ... continue for all 25 options
  ],
  correctAnswers: ['b', 'b', 'c', 'e', 'a'],
  topics: null, 
  isGridFormat: true,
),
//19
Question(
  text: 'I was very disappointed that you didn’t come to the meeting yesterday. (96) there, you (97) all the changes that are awaiting us in the next quarter. (98) your absence, we were able to advance in the elaboration of the new program. (99) such collaboration on the part of your colleagues.(100), we will continue next Wednesday, with or without your presence. ',
  items: ['96.', '97.', '98.', '99.', '100.'],
  gridOptions: [
    'a. You had been',	'b. When you were',	'c. If you were',	'd. Had you been',	'e. While you were',
    'a. would have discovered',	'b. will discover',	'c. would discover',	'd. will have discovered',	'e. discovered',
    'a. Although',	'b. Besides',	'c. As well as',	'd. However',	'e. Despite',
    'a. Never I saw',	'b. Never I see',	'c. Never I’ve seen',	'd. Never have I seen',	'e. I never see',
    'a. Despite',	'b. In spite',	'c. Even though',	'd. Nevertheless',	'e. Wherefore',
    // ... continue for all 25 options
  ],
  correctAnswers: ['d', 'a', 'e', 'd', 'a'],
  topics: null, 
  isGridFormat: true,
),
];
