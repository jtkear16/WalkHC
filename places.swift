/*
Fileaname: Places.swift
Names: Matt Gigliotti, JT Kearney, Abigail Oliver
Class: Programming Languages, Final Project
Professor: Laurie King
Abstract:
The core data structures which the application is built on.
*/
/*
These are the structs that make the locations
*/
struct Location {
var pointNumber = 0
var name = ""
var coordinates: (Double, Double) = (0, 0) // (Lat, Long)
var connectedTo = [Connection]() // An array of connections
}
struct Connection {
var otherPoint = 0; // The number of the point it connects to
var distance: Double = 0.0 // in miles
}
/*
This is the hard coded locations array. Reading from a file proved difficult so we wrote a small swift script to generate this file.
*/
let PLACES = [
Location( pointNumber:0, name:"Gate (Lower)", coordinates: (42.23981, -71.812493), connectedTo:[
Connection(otherPoint:1, distance:0.0667121518330725), 
Connection(otherPoint:6, distance:0.0819908616821031), 
]),
Location( pointNumber:1, name:"Gate (Front)", coordinates: (42.238934, -71.811948), connectedTo:[
Connection(otherPoint:0, distance:0.0667121518330725), 
Connection(otherPoint:4, distance:0.0719930353097013), 
]),
Location( pointNumber:2, name:"Field House", coordinates: (42.236776, -71.810051), connectedTo:[
Connection(otherPoint:12, distance:0.0682340172338046), 
Connection(otherPoint:13, distance:0.0540621144493795), 
Connection(otherPoint:27, distance:0.107959832526765), 
]),
Location( pointNumber:3, name:"Haberlin (Front)", coordinates: (42.238472, -71.810967), connectedTo:[
Connection(otherPoint:10, distance:0.033718421221227), 
]),
Location( pointNumber:4, name:"Guard Shack", coordinates: (42.239, -71.810545), connectedTo:[
Connection(otherPoint:1, distance:0.0719930353097013), 
Connection(otherPoint:5, distance:0.0624431559291437), 
Connection(otherPoint:59, distance:6.92127306573011), 
]),
Location( pointNumber:5, name:"Tennis Court \u{e015}", coordinates: (42.239605, -71.81145), connectedTo:[
Connection(otherPoint:4, distance:0.0624431559291437), 
Connection(otherPoint:6, distance:0.063597941450198), 
]),
Location( pointNumber:6, name:"Fitton Baseball Field \u{e016}", coordinates: (42.240505, -71.811196), connectedTo:[
Connection(otherPoint:0, distance:0.0819908616821031), 
Connection(otherPoint:5, distance:0.063597941450198), 
Connection(otherPoint:7, distance:0.0987588764671391), 
Connection(otherPoint:21, distance:0.0902868963715662), 
]),
Location( pointNumber:7, name:"Fitton Football Field \u{e42b}", coordinates: (42.241565, -71.809904), connectedTo:[
Connection(otherPoint:6, distance:0.0987588764671391), 
]),
Location( pointNumber:8, name:"Stein (First Floor) \u{1F4DA}", coordinates: (42.23983, -71.809676), connectedTo:[
Connection(otherPoint:19, distance:0.0487144271244758), 
Connection(otherPoint:21, distance:0.0542451365724246), 
]),
Location( pointNumber:9, name:"Stein (Front)", coordinates: (42.239445, -71.80977), connectedTo:[
Connection(otherPoint:59, distance:6.89044598704707), 
Connection(otherPoint:60, distance:0.0377419816033043), 
]),
Location( pointNumber:10, name:"Science Courtyard \u{1F52C}", coordinates: (42.238545, -71.810316), connectedTo:[
Connection(otherPoint:3, distance:0.033718421221227), 
Connection(otherPoint:58, distance:0.0191496493289927), 
]),
Location( pointNumber:11, name:"Wheeler (East)", coordinates: (42.237625, -71.809466), connectedTo:[
Connection(otherPoint:2, distance:0.0659262212763378), 
Connection(otherPoint:14, distance:0.0463808960822909), 
Connection(otherPoint:26, distance:0.0534604215004788), 
Connection(otherPoint:57, distance:0.0398112275275257), 
]),
Location( pointNumber:12, name:"Ciampi Hall", coordinates: (42.2366, -71.80874), connectedTo:[
Connection(otherPoint:27, distance:0.0631610200753362), 
]),
Location( pointNumber:13, name:"Wheeler (West)", coordinates: (42.237556, -71.810118), connectedTo:[
Connection(otherPoint:11, distance:0.0337292735379945), 
Connection(otherPoint:14, distance:0.0443903592337746), 
]),
Location( pointNumber:14, name:"Smith Labs (Top) \u{2697}", coordinates: (42.238187, -71.80996), connectedTo:[
Connection(otherPoint:11, distance:0.0463808960822909), 
Connection(otherPoint:13, distance:0.0443903592337746), 
Connection(otherPoint:57, distance:0.0235742128133911), 
]),
Location( pointNumber:15, name:"Beaven Hall", coordinates: (42.238515, -71.809723), connectedTo:[
Connection(otherPoint:57, distance:0.0246001413419117), 
Connection(otherPoint:77, distance:0.0093380399678056), 
]),
Location( pointNumber:16, name:"Dinand Library (Front) \u{1F4DA}", coordinates: (42.23836, -71.80915), connectedTo:[
Connection(otherPoint:57, distance:0.0210653436071271), 
Connection(otherPoint:61, distance:0.0235180265856391), 
Connection(otherPoint:62, distance:0.019655828335953), 
]),
Location( pointNumber:17, name:"O'Kane Hall (Front)", coordinates: (42.23892, -71.808808), connectedTo:[
Connection(otherPoint:60, distance:0.0236609792875809), 
Connection(otherPoint:61, distance:0.0232015842854148), 
]),
Location( pointNumber:18, name:"Public Safety \u{e152}", coordinates: (42.239255, -71.8086), connectedTo:[
Connection(otherPoint:19, distance:0.0278626909667767), 
Connection(otherPoint:60, distance:0.0290869520617211), 
Connection(otherPoint:65, distance:0.0206913684010367), 
]),
Location( pointNumber:19, name:"Carlin Hall (Bridge/Side)", coordinates: (42.23964, -71.80876), connectedTo:[
Connection(otherPoint:8, distance:0.0487144271244758), 
Connection(otherPoint:18, distance:0.0278626909667767), 
Connection(otherPoint:20, distance:0.016203243792122), 
]),
Location( pointNumber:20, name:"Carlin Hall (Front)", coordinates: (42.23987, -71.8087), connectedTo:[
Connection(otherPoint:19, distance:0.016203243792122), 
Connection(otherPoint:21, distance:0.0627085876816318), 
Connection(otherPoint:22, distance:0.0410775645258829), 
Connection(otherPoint:32, distance:0.0703240437131256), 
]),
Location( pointNumber:21, name:"Parking Garage \u{1F697}", coordinates: (42.240594, -71.809437), connectedTo:[
Connection(otherPoint:6, distance:0.0902868963715662), 
Connection(otherPoint:8, distance:0.0542451365724246), 
Connection(otherPoint:20, distance:0.0627085876816318), 
]),
Location( pointNumber:22, name:"Kimball (Front) \u{1F35D}", coordinates: (42.24016, -71.808), connectedTo:[
Connection(otherPoint:20, distance:0.0410775645258829), 
Connection(otherPoint:23, distance:0.0579594307973383), 
Connection(otherPoint:32, distance:0.0375336412594718), 
Connection(otherPoint:33, distance:0.0188124648305111), 
]),
Location( pointNumber:23, name:"Fenwick Hall (Front/Admissions)", coordinates: (42.239323, -71.807947), connectedTo:[
Connection(otherPoint:22, distance:0.0579594307973383), 
Connection(otherPoint:65, distance:0.0236505621627109), 
Connection(otherPoint:66, distance:0.0270001163025838), 
]),
Location( pointNumber:24, name:"O'Kane Hall (Back) \u{1F4D6}", coordinates: (42.238875, -71.80848), connectedTo:[
Connection(otherPoint:75, distance:0.0201662441539694), 
Connection(otherPoint:76, distance:0.063894709167475), 
]),
Location( pointNumber:25, name:"Dinand Library (Side) \u{1F4D6}", coordinates: (42.238182, -71.80905), connectedTo:[
Connection(otherPoint:63, distance:0.0169570211511313), 
]),
Location( pointNumber:26, name:"Hogan Student Center (Front)", coordinates: (42.23772, -71.80843), connectedTo:[
Connection(otherPoint:11, distance:0.0534604215004788), 
Connection(otherPoint:27, distance:0.0283814341295862), 
Connection(otherPoint:63, distance:0.0394307324452992), 
Connection(otherPoint:64, distance:0.0471921141274696), 
]),
Location( pointNumber:27, name:"Hogan Student Center (3rd Floor)", coordinates: (42.237385, -71.80811), connectedTo:[
Connection(otherPoint:2, distance:0.107959832526765), 
Connection(otherPoint:12, distance:0.0631610200753361), 
Connection(otherPoint:26, distance:0.0283814341295862), 
Connection(otherPoint:28, distance:0.027916331684641), 
Connection(otherPoint:54, distance:0.168513007663292), 
]),
Location( pointNumber:28, name:"Hogan Student Center (Easy Street Entrance)", coordinates: (42.23772, -71.807806), connectedTo:[
Connection(otherPoint:27, distance:0.027916331684641), 
Connection(otherPoint:29, distance:0.0235879725857241), 
Connection(otherPoint:64, distance:0.0482890351433444), 
]),
Location( pointNumber:29, name:"Healy Hall (Front)", coordinates: (42.237808, -71.807361), connectedTo:[
Connection(otherPoint:28, distance:0.0235879725857241), 
Connection(otherPoint:69, distance:0.0171509943426787), 
]),
Location( pointNumber:30, name:"Healy Hall (Back)", coordinates: (42.238353, -71.80775), connectedTo:[
Connection(otherPoint:31, distance:0.0250314665361078), 
Connection(otherPoint:64, distance:0.0205180659873326), 
Connection(otherPoint:68, distance:0.0328280086886258), 
]),
Location( pointNumber:31, name:"Smith Hall \u{1F4DA}", coordinates: (42.23871, -71.80783), connectedTo:[
Connection(otherPoint:30, distance:0.0250314665361078), 
Connection(otherPoint:68, distance:0.0299906987522657), 
]),
Location( pointNumber:32, name:"Alumni Hall (Front)", coordinates: (42.23994, -71.80733), connectedTo:[
Connection(otherPoint:20, distance:0.0703240437131256), 
Connection(otherPoint:22, distance:0.0375336412594718), 
Connection(otherPoint:33, distance:0.0280134021859581), 
Connection(otherPoint:66, distance:0.0296660838260371), 
]),
Location( pointNumber:33, name:"Kimball (Side)/Seelos Theater \u{1F371} \u{1F39F}", coordinates: (42.240263, -71.80766), connectedTo:[
Connection(otherPoint:22, distance:0.0188124648305111), 
Connection(otherPoint:32, distance:0.0280134021859581), 
Connection(otherPoint:45, distance:0.156063751048084), 
]),
Location( pointNumber:34, name:"Williams Hall", coordinates: (42.2399, -71.806135), connectedTo:[
Connection(otherPoint:44, distance:0.0547918247429935), 
Connection(otherPoint:56, distance:0.056560045843153), 
Connection(otherPoint:67, distance:0.0505730777110102), 
]),
Location( pointNumber:35, name:"St. Joseph's Chapel \u{26ea}", coordinates: (42.23943, -71.8069), connectedTo:[
Connection(otherPoint:36, distance:0.0223868240604504), 
Connection(otherPoint:56, distance:0.0216626407415991), 
Connection(otherPoint:66, distance:0.0314949359432405), 
]),
Location( pointNumber:36, name:"Music Center \u{1F3B6} \u{1F3BB}", coordinates: (42.23927, -71.80728), connectedTo:[
Connection(otherPoint:35, distance:0.0223868240604504), 
Connection(otherPoint:66, distance:0.0212218050886706), 
Connection(otherPoint:67, distance:0.0618402591133919), 
Connection(otherPoint:76, distance:0.0166718957725726), 
]),
Location( pointNumber:37, name:"Lehy Hall (Back)", coordinates: (42.23852, -71.8069), connectedTo:[
Connection(otherPoint:40, distance:0.0294461683915323), 
Connection(otherPoint:68, distance:0.0200529234834643), 
Connection(otherPoint:70, distance:0.0177874728878314), 
]),
Location( pointNumber:38, name:"Lehy Hall (Front)", coordinates: (42.237892, -71.806769), connectedTo:[
Connection(otherPoint:69, distance:0.0144009923609322), 
Connection(otherPoint:71, distance:0.0104617369052516), 
]),
Location( pointNumber:39, name:"Hanselman Hall (Front)", coordinates: (42.237892, -71.80643), connectedTo:[
Connection(otherPoint:48, distance:0.0326419834324707), 
Connection(otherPoint:71, distance:0.0069356272171484), 
]),
Location( pointNumber:40, name:"Hanselman Hall (Back)", coordinates: (42.23852, -71.806325), connectedTo:[
Connection(otherPoint:37, distance:0.0294461683915323), 
Connection(otherPoint:41, distance:0.0213407133617978), 
Connection(otherPoint:47, distance:0.04707008428799), 
Connection(otherPoint:70, distance:0.0147775727127772), 
]),
Location( pointNumber:41, name:"Campion House  \u{1F36A}", coordinates: (42.2388, -71.80615), connectedTo:[
Connection(otherPoint:40, distance:0.0213407133617978), 
Connection(otherPoint:67, distance:0.0258429758672587), 
]),
Location( pointNumber:42, name:"Millard Art Center \u{1F3A8}", coordinates: (42.23895, -71.8056), connectedTo:[
Connection(otherPoint:43, distance:0.0242097332496479), 
Connection(otherPoint:67, distance:0.028910141522383), 
Connection(otherPoint:73, distance:0.0291584422555579), 
]),
Location( pointNumber:43, name:"Health Services/Loyola Hall \u{1F912}", coordinates: (42.2393, -71.8056), connectedTo:[
Connection(otherPoint:42, distance:0.0242097332496479), 
Connection(otherPoint:46, distance:0.0418641567718128), 
Connection(otherPoint:67, distance:0.0261740067054946), 
]),
Location( pointNumber:44, name:"Loyola Hall (Gym) \u{1F3FD}", coordinates: (42.239374, -71.805335), connectedTo:[
Connection(otherPoint:34, distance:0.0547918247429935), 
]),
Location( pointNumber:45, name:"Softball Field", coordinates: (42.2408, -71.8047), connectedTo:[
Connection(otherPoint:33, distance:0.156063751048084), 
]),
Location( pointNumber:46, name:"Loyola Hall (Entrance 2)", coordinates: (42.239, -71.80489), connectedTo:[
Connection(otherPoint:43, distance:0.0418641567718128), 
Connection(otherPoint:73, distance:0.0289505562923335), 
]),
Location( pointNumber:47, name:"Clark Hall (Back)", coordinates: (42.23835, -71.805435), connectedTo:[
Connection(otherPoint:40, distance:0.04707008428799), 
Connection(otherPoint:50, distance:0.0517212349490494), 
Connection(otherPoint:73, distance:0.0239883739728549), 
]),
Location( pointNumber:48, name:"Clark Hall (Front)", coordinates: (42.237768, -71.805815), connectedTo:[
Connection(otherPoint:39, distance:0.0326419834324707), 
Connection(otherPoint:72, distance:0.0217669903611882), 
]),
Location( pointNumber:49, name:"Mulledy Hall (Entrance 1)", coordinates: (42.23747, -71.80505), connectedTo:[
Connection(otherPoint:52, distance:0.0176164572195376), 
Connection(otherPoint:72, distance:0.0239661186196972), 
]),
Location( pointNumber:50, name:"Mulledy Hall (Back)", coordinates: (42.237774, -71.804791), connectedTo:[
Connection(otherPoint:47, distance:0.0517212349490494), 
Connection(otherPoint:51, distance:0.0256652306495069), 
]),
Location( pointNumber:51, name:"Mulledy Hall (Common Room)", coordinates: (42.23746, -71.804524), connectedTo:[
Connection(otherPoint:50, distance:0.0256652306495069), 
]),
Location( pointNumber:52, name:"Mulledy Hall (Entrance 2)", coordinates: (42.237289, -71.804808), connectedTo:[
Connection(otherPoint:49, distance:0.0176164572195376), 
Connection(otherPoint:74, distance:0.0198627175499614), 
]),
Location( pointNumber:53, name:"Figge Hall", coordinates: (42.23665, -71.80483), connectedTo:[
Connection(otherPoint:74, distance:0.0340598107007502), 
]),
Location( pointNumber:54, name:"Hart Center (Front) \u{1F3C0} \u{1F3D2}", coordinates: (42.23524, -71.80655), connectedTo:[
Connection(otherPoint:27, distance:0.168513007663292), 
Connection(otherPoint:55, distance:0.0663839299992252), 
]),
Location( pointNumber:55, name:"Hart Center (Back) \u{1F3D1} \u{26BD}", coordinates: (42.23435, -71.806065), connectedTo:[
Connection(otherPoint:54, distance:0.0663839299992252), 
]),
Location( pointNumber:56, name:"Alumni Hall (Bridge/Side)", coordinates: (42.239658, -71.80719), connectedTo:[
Connection(otherPoint:34, distance:0.056560045843153), 
Connection(otherPoint:35, distance:0.0216626407415991), 
Connection(otherPoint:66, distance:0.0181771273770323), 
]),
Location( pointNumber:57, name:"100", coordinates: (42.2382, -71.8095), connectedTo:[
Connection(otherPoint:11, distance:0.0398112275275257), 
Connection(otherPoint:14, distance:0.0235742128133911), 
Connection(otherPoint:15, distance:0.0246001413419117), 
Connection(otherPoint:16, distance:0.0210653436071271), 
]),
Location( pointNumber:58, name:"101", coordinates: (42.23865, -71.80997), connectedTo:[
Connection(otherPoint:10, distance:0.0191496493289927), 
Connection(otherPoint:59, distance:6.94542678568877), 
Connection(otherPoint:77, distance:0.0126490236680705), 
]),
Location( pointNumber:59, name:"102", coordinates: (42.33906, -71.81), connectedTo:[
Connection(otherPoint:4, distance:6.92127306573011), 
Connection(otherPoint:9, distance:6.89044598704707), 
Connection(otherPoint:58, distance:6.94542678568877), 
Connection(otherPoint:60, distance:6.91097814935662), 
]),
Location( pointNumber:60, name:"103", coordinates: (42.23915, -71.80915), connectedTo:[
Connection(otherPoint:9, distance:0.0377419816033043), 
Connection(otherPoint:17, distance:0.0236609792875809), 
Connection(otherPoint:18, distance:0.0290869520617211), 
Connection(otherPoint:59, distance:6.91097814935662), 
Connection(otherPoint:61, distance:0.0311267998926853), 
]),
Location( pointNumber:61, name:"104", coordinates: (42.2387, -71.80915), connectedTo:[
Connection(otherPoint:16, distance:0.0235180265856391), 
Connection(otherPoint:17, distance:0.0232015842854148), 
Connection(otherPoint:60, distance:0.0311267998926853), 
Connection(otherPoint:75, distance:0.0486943000232403), 
Connection(otherPoint:77, distance:0.0295467884380508), 
]),
Location( pointNumber:62, name:"105", coordinates: (42.2384, -71.80877), connectedTo:[
Connection(otherPoint:16, distance:0.019655828335953), 
Connection(otherPoint:63, distance:0.0109153858773115), 
]),
Location( pointNumber:63, name:"106", coordinates: (42.238245, -71.80873), connectedTo:[
Connection(otherPoint:25, distance:0.0169570211511313), 
Connection(otherPoint:26, distance:0.0394307324452992), 
Connection(otherPoint:62, distance:0.0109153858773115), 
Connection(otherPoint:64, distance:0.0309352067208673), 
]),
Location( pointNumber:64, name:"107", coordinates: (42.23837, -71.80815), connectedTo:[
Connection(otherPoint:26, distance:0.0471921141274696), 
Connection(otherPoint:28, distance:0.0482890351433444), 
Connection(otherPoint:30, distance:0.0205180659873326), 
Connection(otherPoint:63, distance:0.0309352067208673), 
Connection(otherPoint:75, distance:0.0209085782639696), 
]),
Location( pointNumber:65, name:"108", coordinates: (42.23949, -71.80835), connectedTo:[
Connection(otherPoint:18, distance:0.0206913684010367), 
Connection(otherPoint:23, distance:0.0236505621627109), 
Connection(otherPoint:66, distance:0.0436162817468869), 
]),
Location( pointNumber:66, name:"109", coordinates: (42.23953, -71.8075), connectedTo:[
Connection(otherPoint:23, distance:0.0270001163025838), 
Connection(otherPoint:32, distance:0.0296660838260371), 
Connection(otherPoint:35, distance:0.0314949359432405), 
Connection(otherPoint:36, distance:0.0212218050886706), 
Connection(otherPoint:56, distance:0.0181771273770323), 
Connection(otherPoint:65, distance:0.0436162817468869), 
]),
Location( pointNumber:67, name:"110", coordinates: (42.23917, -71.80608), connectedTo:[
Connection(otherPoint:34, distance:0.0505730777110102), 
Connection(otherPoint:36, distance:0.0618402591133919), 
Connection(otherPoint:41, distance:0.0258429758672587), 
Connection(otherPoint:42, distance:0.028910141522383), 
Connection(otherPoint:43, distance:0.0261740067054946), 
]),
Location( pointNumber:68, name:"111", coordinates: (42.23865, -71.80725), connectedTo:[
Connection(otherPoint:30, distance:0.0328280086886258), 
Connection(otherPoint:31, distance:0.0299906987522657), 
Connection(otherPoint:37, distance:0.0200529234834643), 
Connection(otherPoint:69, distance:0.0528793837423254), 
Connection(otherPoint:76, distance:0.0262848532426574), 
]),
Location( pointNumber:69, name:"112", coordinates: (42.2379, -71.80705), connectedTo:[
Connection(otherPoint:29, distance:0.0171509943426787), 
Connection(otherPoint:38, distance:0.0144009923609322), 
Connection(otherPoint:68, distance:0.0528793837423254), 
]),
Location( pointNumber:70, name:"113", coordinates: (42.23842, -71.80658), connectedTo:[
Connection(otherPoint:37, distance:0.0177874728878314), 
Connection(otherPoint:40, distance:0.0147775727127772), 
Connection(otherPoint:71, distance:0.0359769482549747), 
]),
Location( pointNumber:71, name:"114", coordinates: (42.2379, -71.806565), connectedTo:[
Connection(otherPoint:38, distance:0.0104617369052516), 
Connection(otherPoint:39, distance:0.0069356272171484), 
Connection(otherPoint:70, distance:0.0359769482549747), 
]),
Location( pointNumber:72, name:"115", coordinates: (42.2377, -71.8054), connectedTo:[
Connection(otherPoint:48, distance:0.0217669903611882), 
Connection(otherPoint:49, distance:0.0239661186196972), 
Connection(otherPoint:73, distance:0.0665055420961626), 
]),
Location( pointNumber:73, name:"116", coordinates: (42.23865, -71.8052), connectedTo:[
Connection(otherPoint:42, distance:0.0291584422555579), 
Connection(otherPoint:46, distance:0.0289505562923335), 
Connection(otherPoint:47, distance:0.0239883739728549), 
Connection(otherPoint:72, distance:0.0665055420961626), 
]),
Location( pointNumber:74, name:"117", coordinates: (42.2371, -71.8051), connectedTo:[
Connection(otherPoint:52, distance:0.0198627175499614), 
Connection(otherPoint:53, distance:0.0340598107007502), 
]),
Location( pointNumber:75, name:"118", coordinates: (42.23867, -71.8082), connectedTo:[
Connection(otherPoint:24, distance:0.0201662441539694), 
Connection(otherPoint:61, distance:0.0486943000232403), 
Connection(otherPoint:64, distance:0.0209085782639696), 
]),
Location( pointNumber:76, name:"119", coordinates: (42.23903, -71.80725), connectedTo:[
Connection(otherPoint:24, distance:0.063894709167475), 
Connection(otherPoint:36, distance:0.0166718957725726), 
Connection(otherPoint:68, distance:0.0262848532426574), 
]),
Location( pointNumber:77, name:"120", coordinates: (42.23865, -71.809723), connectedTo:[
Connection(otherPoint:15, distance:0.0093380399678056), 
Connection(otherPoint:57, distance:0.0331556071808403), 
Connection(otherPoint:61, distance:0.0295467884380508), 
]),
]
/*
The initial Boolean array that tells the program whether or not to display pins
*/
var PINBOOL = [Bool](count: PLACES.count, repeatedValue: false)
/*
Tuple array that is used for Picker data
*/
let PICKERARRAY = [
("Alumni Hall (Bridge/Side)", 56),
("Alumni Hall (Front)", 32),
("Beaven Hall", 15),
("Campion House  \u{1F36A}", 41),
("Carlin Hall (Bridge/Side)", 19),
("Carlin Hall (Front)", 20),
("Ciampi Hall", 12),
("Clark Hall (Back)", 47),
("Clark Hall (Front)", 48),
("Dinand Library (Front) \u{1F4DA}", 16),
("Dinand Library (Side) \u{1F4D6}", 25),
("Fenwick Hall (Front/Admissions)", 23),
("Field House", 2),
("Figge Hall", 53),
("Fitton Baseball Field \u{e016}", 6),
("Fitton Football Field \u{e42b}", 7),
("Gate (Front)", 1),
("Gate (Lower)", 0),
("Guard Shack", 4),
("Haberlin (Front)", 3),
("Hanselman Hall (Back)", 40),
("Hanselman Hall (Front)", 39),
("Hart Center (Back) \u{1F3D1} \u{26BD}", 55),
("Hart Center (Front) \u{1F3C0} \u{1F3D2}", 54),
("Health Services/Loyola Hall \u{1F912}", 43),
("Healy Hall (Back)", 30),
("Healy Hall (Front)", 29),
("Hogan Student Center (3rd Floor)", 27),
("Hogan Student Center (Easy Street Entrance)", 28),
("Hogan Student Center (Front)", 26),
("Kimball (Front) \u{1F35D}", 22),
("Kimball (Side)/Seelos Theater \u{1F371} \u{1F39F}", 33),
("Lehy Hall (Back)", 37),
("Lehy Hall (Front)", 38),
("Loyola Hall (Entrance 2)", 46),
("Loyola Hall (Gym) \u{1F3FD}", 44),
("Millard Art Center \u{1F3A8}", 42),
("Mulledy Hall (Back)", 50),
("Mulledy Hall (Common Room)", 51),
("Mulledy Hall (Entrance 1)", 49),
("Mulledy Hall (Entrance 2)", 52),
("Music Center \u{1F3B6} \u{1F3BB}", 36),
("O'Kane Hall (Back) \u{1F4D6}", 24),
("O'Kane Hall (Front)", 17),
("Parking Garage \u{1F697}", 21),
("Public Safety \u{e152}", 18),
("Science Courtyard \u{1F52C}", 10),
("Smith Hall \u{1F4DA}", 31),
("Smith Labs (Top) \u{2697}", 14),
("Softball Field", 45),
("St. Joseph's Chapel \u{26ea}", 35),
("Stein (First Floor) \u{1F4DA}", 8),
("Stein (Front)", 9),
("Tennis Court \u{e015}", 5),
("Wheeler (East)", 11),
("Wheeler (West)", 13),
("Williams Hall", 34),
]
/** unicode data found at : http://unicode.org/emoji/charts/full-emoji-list.html#1f371 */
