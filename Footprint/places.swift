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
Location( pointNumber:0, name:"Gate (Lower)", coordinates: (42.239809999999999, -71.812493000000003), connectedTo:[
Connection(otherPoint:1, distance:0.0667121518330725), 
Connection(otherPoint:6, distance:0.0819908616821031), 
]),
Location( pointNumber:1, name:"Gate (Front)", coordinates: (42.238934, -71.811948000000001), connectedTo:[
Connection(otherPoint:0, distance:0.0667121518330725), 
Connection(otherPoint:4, distance:0.0719930353097013), 
]),
Location( pointNumber:2, name:"Field House", coordinates: (42.236775999999999, -71.810051000000001), connectedTo:[
Connection(otherPoint:12, distance:0.0682340172338046), 
Connection(otherPoint:13, distance:0.0540621144493795), 
Connection(otherPoint:27, distance:0.107959832526765), 
]),
Location( pointNumber:3, name:"Haberlin (Front)", coordinates: (42.238472000000002, -71.810967000000005), connectedTo:[
Connection(otherPoint:10, distance:0.033718421221227), 
]),
Location( pointNumber:4, name:"Guard Shack", coordinates: (42.238999999999997, -71.810545000000005), connectedTo:[
Connection(otherPoint:1, distance:0.0719930353097013), 
Connection(otherPoint:5, distance:0.0624431559291437), 
Connection(otherPoint:59, distance:0.0268140989209735), 
]),
Location( pointNumber:5, name:"Tennis Court \u{e015}", coordinates: (42.239604999999997, -71.811449999999994), connectedTo:[
Connection(otherPoint:4, distance:0.0624431559291437), 
Connection(otherPoint:6, distance:0.063597941450198), 
]),
Location( pointNumber:6, name:"Fitton Baseball Field \u{e016}", coordinates: (42.240504999999999, -71.811195999999995), connectedTo:[
Connection(otherPoint:0, distance:0.0819908616821031), 
Connection(otherPoint:5, distance:0.063597941450198), 
Connection(otherPoint:7, distance:0.0987588764671391), 
Connection(otherPoint:21, distance:0.0902868963715662), 
]),
Location( pointNumber:7, name:"Fitton Football Field \u{e42b}", coordinates: (42.241565000000001, -71.809904000000003), connectedTo:[
Connection(otherPoint:6, distance:0.0987588764671391), 
]),
Location( pointNumber:8, name:"Stein (First Floor) \u{1F4DA}", coordinates: (42.239829999999998, -71.809675999999996), connectedTo:[
Connection(otherPoint:19, distance:0.0487144271244758), 
Connection(otherPoint:21, distance:0.0542451365724246), 
]),
Location( pointNumber:9, name:"Stein (Front)", coordinates: (42.239445000000003, -71.80977), connectedTo:[
Connection(otherPoint:59, distance:0.0291566661937494), 
Connection(otherPoint:60, distance:0.0377419816033043), 
]),
Location( pointNumber:10, name:"Science Courtyard \u{1F52C}", coordinates: (42.238545000000002, -71.810316), connectedTo:[
Connection(otherPoint:3, distance:0.033718421221227), 
Connection(otherPoint:58, distance:0.0191496493289927), 
]),
Location( pointNumber:11, name:"Wheeler (East)", coordinates: (42.237625000000001, -71.809466), connectedTo:[
Connection(otherPoint:2, distance:0.0659262212763378), 
Connection(otherPoint:14, distance:0.0463808960822909), 
Connection(otherPoint:26, distance:0.0534604215004788), 
Connection(otherPoint:57, distance:0.0398112275275257), 
]),
Location( pointNumber:12, name:"Ciampi Hall", coordinates: (42.236600000000003, -71.80874), connectedTo:[
Connection(otherPoint:27, distance:0.0631610200753362), 
]),
Location( pointNumber:13, name:"Wheeler (West)", coordinates: (42.237555999999998, -71.810118000000003), connectedTo:[
Connection(otherPoint:11, distance:0.0337292735379945), 
Connection(otherPoint:14, distance:0.0443903592337746), 
]),
Location( pointNumber:14, name:"Smith Labs (Top) \u{2697}", coordinates: (42.238187000000003, -71.809960000000004), connectedTo:[
Connection(otherPoint:11, distance:0.0463808960822909), 
Connection(otherPoint:13, distance:0.0443903592337746), 
Connection(otherPoint:57, distance:0.0235742128133911), 
]),
Location( pointNumber:15, name:"Beaven Hall", coordinates: (42.238515, -71.809723000000005), connectedTo:[
Connection(otherPoint:57, distance:0.0246001413419117), 
Connection(otherPoint:77, distance:0.0093380399678056), 
]),
Location( pointNumber:16, name:"Dinand Library (Front) \u{1F4DA}", coordinates: (42.23836, -71.809150000000002), connectedTo:[
Connection(otherPoint:57, distance:0.0210653436071271), 
Connection(otherPoint:61, distance:0.0235180265856391), 
Connection(otherPoint:62, distance:0.019655828335953), 
]),
Location( pointNumber:17, name:"O'Kane Hall (Front)", coordinates: (42.23892, -71.808807999999999), connectedTo:[
Connection(otherPoint:60, distance:0.0236609792875809), 
Connection(otherPoint:61, distance:0.0232015842854148), 
]),
Location( pointNumber:18, name:"Public Safety \u{e152}", coordinates: (42.239255, -71.808599999999998), connectedTo:[
Connection(otherPoint:19, distance:0.0278626909667767), 
Connection(otherPoint:60, distance:0.0290869520617211), 
Connection(otherPoint:65, distance:0.0206913684010367), 
]),
Location( pointNumber:19, name:"Carlin Hall (Bridge/Side)", coordinates: (42.239640000000001, -71.808760000000007), connectedTo:[
Connection(otherPoint:8, distance:0.0487144271244758), 
Connection(otherPoint:18, distance:0.0278626909667767), 
Connection(otherPoint:20, distance:0.016203243792122), 
]),
Location( pointNumber:20, name:"Carlin Hall (Front)", coordinates: (42.239870000000003, -71.808700000000002), connectedTo:[
Connection(otherPoint:19, distance:0.016203243792122), 
Connection(otherPoint:21, distance:0.0627085876816318), 
Connection(otherPoint:22, distance:0.0410775645258829), 
Connection(otherPoint:32, distance:0.0703240437131256), 
]),
Location( pointNumber:21, name:"Parking Garage \u{1F697}", coordinates: (42.240594000000002, -71.809437000000003), connectedTo:[
Connection(otherPoint:6, distance:0.0902868963715662), 
Connection(otherPoint:8, distance:0.0542451365724246), 
Connection(otherPoint:20, distance:0.0627085876816318), 
]),
Location( pointNumber:22, name:"Kimball (Front) \u{1F35D}", coordinates: (42.240160000000003, -71.808000000000007), connectedTo:[
Connection(otherPoint:20, distance:0.0410775645258829), 
Connection(otherPoint:23, distance:0.0579594307973383), 
Connection(otherPoint:32, distance:0.0375336412594718), 
Connection(otherPoint:33, distance:0.0188124648305111), 
]),
Location( pointNumber:23, name:"Fenwick Hall-Admissions Office", coordinates: (42.239322999999999, -71.807946999999999), connectedTo:[
Connection(otherPoint:22, distance:0.0579594307973383), 
Connection(otherPoint:65, distance:0.0236505621627109), 
Connection(otherPoint:66, distance:0.0270001163025838), 
]),
Location( pointNumber:24, name:"O'Kane Hall (Back) \u{1F4D6}", coordinates: (42.238875, -71.808480000000003), connectedTo:[
Connection(otherPoint:75, distance:0.0201662441539694), 
Connection(otherPoint:76, distance:0.063894709167475), 
]),
Location( pointNumber:25, name:"Dinand Library (Side) \u{1F4D6}", coordinates: (42.238182000000002, -71.809049999999999), connectedTo:[
Connection(otherPoint:63, distance:0.0169570211511313), 
]),
Location( pointNumber:26, name:"Hogan Student Center (Front)", coordinates: (42.237720000000003, -71.808430000000001), connectedTo:[
Connection(otherPoint:11, distance:0.0534604215004788), 
Connection(otherPoint:27, distance:0.0283814341295862), 
Connection(otherPoint:63, distance:0.0394307324452992), 
Connection(otherPoint:64, distance:0.0471921141274696), 
]),
Location( pointNumber:27, name:"Hogan Student Center (3rd Floor)", coordinates: (42.237385000000003, -71.808109999999999), connectedTo:[
Connection(otherPoint:2, distance:0.107959832526765), 
Connection(otherPoint:12, distance:0.0631610200753361), 
Connection(otherPoint:26, distance:0.0283814341295862), 
Connection(otherPoint:28, distance:0.027916331684641), 
Connection(otherPoint:54, distance:0.168513007663292), 
]),
Location( pointNumber:28, name:"Hogan Student Center (Easy Street Entrance)", coordinates: (42.237720000000003, -71.807805999999999), connectedTo:[
Connection(otherPoint:27, distance:0.027916331684641), 
Connection(otherPoint:29, distance:0.0235879725857241), 
Connection(otherPoint:64, distance:0.0482890351433444), 
]),
Location( pointNumber:29, name:"Healy Hall (Front)", coordinates: (42.237808000000001, -71.807361), connectedTo:[
Connection(otherPoint:28, distance:0.0235879725857241), 
Connection(otherPoint:69, distance:0.0171509943426787), 
]),
Location( pointNumber:30, name:"Healy Hall (Back)", coordinates: (42.238352999999996, -71.807749999999999), connectedTo:[
Connection(otherPoint:31, distance:0.0250314665361078), 
Connection(otherPoint:64, distance:0.0205180659873326), 
Connection(otherPoint:68, distance:0.0328280086886258), 
]),
Location( pointNumber:31, name:"Smith Hall \u{1F4DA}", coordinates: (42.238709999999998, -71.807829999999996), connectedTo:[
Connection(otherPoint:30, distance:0.0250314665361078), 
Connection(otherPoint:68, distance:0.0299906987522657), 
]),
Location( pointNumber:32, name:"Alumni Hall (Front)", coordinates: (42.239939999999997, -71.807329999999993), connectedTo:[
Connection(otherPoint:20, distance:0.0703240437131256), 
Connection(otherPoint:22, distance:0.0375336412594718), 
Connection(otherPoint:33, distance:0.0280134021859581), 
Connection(otherPoint:66, distance:0.0296660838260371), 
]),
Location( pointNumber:33, name:"Kimball (Lower) \u{1F371}-Seelos Theater \u{1F39F}", coordinates: (42.240262999999999, -71.807659999999998), connectedTo:[
Connection(otherPoint:22, distance:0.0188124648305111), 
Connection(otherPoint:32, distance:0.0280134021859581), 
Connection(otherPoint:45, distance:0.156063751048084), 
]),
Location( pointNumber:34, name:"Williams Hall", coordinates: (42.239899999999999, -71.806134999999998), connectedTo:[
Connection(otherPoint:44, distance:0.0547918247429935), 
Connection(otherPoint:56, distance:0.056560045843153), 
Connection(otherPoint:67, distance:0.0505730777110102), 
]),
Location( pointNumber:35, name:"St. Joseph's Chapel \u{26ea}", coordinates: (42.239429999999999, -71.806899999999999), connectedTo:[
Connection(otherPoint:36, distance:0.0223868240604504), 
Connection(otherPoint:56, distance:0.0216626407415991), 
Connection(otherPoint:66, distance:0.0314949359432405), 
]),
Location( pointNumber:36, name:"Music Center \u{1F3B6} \u{1F3BB}", coordinates: (42.239269999999998, -71.807280000000006), connectedTo:[
Connection(otherPoint:35, distance:0.0223868240604504), 
Connection(otherPoint:66, distance:0.0212218050886706), 
Connection(otherPoint:67, distance:0.0618402591133919), 
Connection(otherPoint:76, distance:0.0166718957725726), 
]),
Location( pointNumber:37, name:"Lehy Hall (Back)", coordinates: (42.238520000000001, -71.806899999999999), connectedTo:[
Connection(otherPoint:40, distance:0.0294461683915323), 
Connection(otherPoint:68, distance:0.0200529234834643), 
Connection(otherPoint:70, distance:0.0177874728878314), 
]),
Location( pointNumber:38, name:"Lehy Hall (Front)", coordinates: (42.237892000000002, -71.806769000000003), connectedTo:[
Connection(otherPoint:69, distance:0.0144009923609322), 
Connection(otherPoint:71, distance:0.0104617369052516), 
]),
Location( pointNumber:39, name:"Hanselman Hall (Front)", coordinates: (42.237892000000002, -71.806430000000006), connectedTo:[
Connection(otherPoint:48, distance:0.0326419834324707), 
Connection(otherPoint:71, distance:0.0069356272171484), 
]),
Location( pointNumber:40, name:"Hanselman Hall (Back)", coordinates: (42.238520000000001, -71.806325000000001), connectedTo:[
Connection(otherPoint:37, distance:0.0294461683915323), 
Connection(otherPoint:41, distance:0.0213407133617978), 
Connection(otherPoint:47, distance:0.04707008428799), 
Connection(otherPoint:70, distance:0.0147775727127772), 
]),
Location( pointNumber:41, name:"Campion House  \u{1F36A}", coordinates: (42.238799999999998, -71.806150000000002), connectedTo:[
Connection(otherPoint:40, distance:0.0213407133617978), 
Connection(otherPoint:67, distance:0.0258429758672587), 
]),
Location( pointNumber:42, name:"Millard Art Center \u{1F3A8}", coordinates: (42.238950000000003, -71.805599999999998), connectedTo:[
Connection(otherPoint:43, distance:0.0242097332496479), 
Connection(otherPoint:67, distance:0.028910141522383), 
Connection(otherPoint:73, distance:0.0291584422555579), 
]),
Location( pointNumber:43, name:"Health Services \u{1F912}_Loyola Hall", coordinates: (42.2393, -71.805599999999998), connectedTo:[
Connection(otherPoint:42, distance:0.0242097332496479), 
Connection(otherPoint:46, distance:0.0418641567718128), 
Connection(otherPoint:67, distance:0.0261740067054946), 
]),
Location( pointNumber:44, name:"Loyola Hall (Gym) \u{1F3FD}", coordinates: (42.239373999999998, -71.805334999999999), connectedTo:[
Connection(otherPoint:34, distance:0.0547918247429935), 
]),
Location( pointNumber:45, name:"Softball Field", coordinates: (42.2408, -71.804699999999997), connectedTo:[
Connection(otherPoint:33, distance:0.156063751048084), 
]),
Location( pointNumber:46, name:"Loyola Hall (Entrance 2)", coordinates: (42.238999999999997, -71.80489), connectedTo:[
Connection(otherPoint:43, distance:0.0418641567718128), 
Connection(otherPoint:73, distance:0.0289505562923335), 
]),
Location( pointNumber:47, name:"Clark Hall (Back)", coordinates: (42.238349999999997, -71.805435000000003), connectedTo:[
Connection(otherPoint:40, distance:0.04707008428799), 
Connection(otherPoint:50, distance:0.0517212349490494), 
Connection(otherPoint:73, distance:0.0239883739728549), 
]),
Location( pointNumber:48, name:"Clark Hall (Front)", coordinates: (42.237768000000003, -71.805814999999996), connectedTo:[
Connection(otherPoint:39, distance:0.0326419834324707), 
Connection(otherPoint:72, distance:0.0217669903611882), 
]),
Location( pointNumber:49, name:"Mulledy Hall (Entrance 1)", coordinates: (42.237470000000002, -71.805049999999994), connectedTo:[
Connection(otherPoint:52, distance:0.0176164572195376), 
Connection(otherPoint:72, distance:0.0239661186196972), 
]),
Location( pointNumber:50, name:"Mulledy Hall (Back)", coordinates: (42.237774000000002, -71.804790999999994), connectedTo:[
Connection(otherPoint:47, distance:0.0517212349490494), 
Connection(otherPoint:51, distance:0.0256652306495069), 
]),
Location( pointNumber:51, name:"Mulledy Hall (Common Room)", coordinates: (42.237459999999999, -71.804524000000001), connectedTo:[
Connection(otherPoint:50, distance:0.0256652306495069), 
]),
Location( pointNumber:52, name:"Mulledy Hall (Entrance 2)", coordinates: (42.237288999999997, -71.804807999999994), connectedTo:[
Connection(otherPoint:49, distance:0.0176164572195376), 
Connection(otherPoint:74, distance:0.0198627175499614), 
]),
Location( pointNumber:53, name:"Figge Hall", coordinates: (42.236649999999997, -71.804829999999995), connectedTo:[
Connection(otherPoint:74, distance:0.0340598107007502), 
]),
Location( pointNumber:54, name:"Hart Center (Front) \u{1F3C0} \u{1F3D2}", coordinates: (42.235239999999997, -71.806550000000001), connectedTo:[
Connection(otherPoint:27, distance:0.168513007663292), 
Connection(otherPoint:55, distance:0.0663839299992252), 
]),
Location( pointNumber:55, name:"Hart Center (Back) \u{1F3D1} \u{26BD}", coordinates: (42.234349999999999, -71.806065000000004), connectedTo:[
Connection(otherPoint:54, distance:0.0663839299992252), 
]),
Location( pointNumber:56, name:"Alumni Hall (Bridge)", coordinates: (42.239657999999999, -71.807190000000006), connectedTo:[
Connection(otherPoint:34, distance:0.056560045843153), 
Connection(otherPoint:35, distance:0.0216626407415991), 
Connection(otherPoint:66, distance:0.0181771273770323), 
]),
Location( pointNumber:57, name:"100", coordinates: (42.238199999999999, -71.8095), connectedTo:[
Connection(otherPoint:11, distance:0.0398112275275257), 
Connection(otherPoint:14, distance:0.0235742128133911), 
Connection(otherPoint:15, distance:0.0246001413419117), 
Connection(otherPoint:16, distance:0.0210653436071271), 
]),
Location( pointNumber:58, name:"101", coordinates: (42.23865, -71.809970000000007), connectedTo:[
Connection(otherPoint:10, distance:0.0191496493289927), 
Connection(otherPoint:59, distance:0.0292137149692255), 
Connection(otherPoint:77, distance:0.0126490236680705), 
]),
Location( pointNumber:59, name:"102", coordinates: (42.239069999999998, -71.810029999999998), connectedTo:[
Connection(otherPoint:4, distance:0.0268140989209735), 
Connection(otherPoint:9, distance:0.0291566661937494), 
Connection(otherPoint:58, distance:0.0292137149692255), 
Connection(otherPoint:60, distance:0.0454034938474396), 
]),
Location( pointNumber:60, name:"103", coordinates: (42.239150000000002, -71.809150000000002), connectedTo:[
Connection(otherPoint:9, distance:0.0377419816033043), 
Connection(otherPoint:17, distance:0.0236609792875809), 
Connection(otherPoint:18, distance:0.0290869520617211), 
Connection(otherPoint:59, distance:0.0454034938474396), 
Connection(otherPoint:61, distance:0.0311267998926853), 
]),
Location( pointNumber:61, name:"104", coordinates: (42.238700000000001, -71.809150000000002), connectedTo:[
Connection(otherPoint:16, distance:0.0235180265856391), 
Connection(otherPoint:17, distance:0.0232015842854148), 
Connection(otherPoint:60, distance:0.0311267998926853), 
Connection(otherPoint:75, distance:0.0486943000232403), 
Connection(otherPoint:77, distance:0.0295467884380508), 
]),
Location( pointNumber:62, name:"105", coordinates: (42.238399999999999, -71.808769999999996), connectedTo:[
Connection(otherPoint:16, distance:0.019655828335953), 
Connection(otherPoint:63, distance:0.0109153858773115), 
]),
Location( pointNumber:63, name:"106", coordinates: (42.238244999999999, -71.808729999999997), connectedTo:[
Connection(otherPoint:25, distance:0.0169570211511313), 
Connection(otherPoint:26, distance:0.0394307324452992), 
Connection(otherPoint:62, distance:0.0109153858773115), 
Connection(otherPoint:64, distance:0.0309352067208673), 
]),
Location( pointNumber:64, name:"107", coordinates: (42.238370000000003, -71.808149999999998), connectedTo:[
Connection(otherPoint:26, distance:0.0471921141274696), 
Connection(otherPoint:28, distance:0.0482890351433444), 
Connection(otherPoint:30, distance:0.0205180659873326), 
Connection(otherPoint:63, distance:0.0309352067208673), 
Connection(otherPoint:75, distance:0.0209085782639696), 
]),
Location( pointNumber:65, name:"108", coordinates: (42.239490000000004, -71.808350000000004), connectedTo:[
Connection(otherPoint:18, distance:0.0206913684010367), 
Connection(otherPoint:23, distance:0.0236505621627109), 
Connection(otherPoint:66, distance:0.0436162817468869), 
]),
Location( pointNumber:66, name:"109", coordinates: (42.239530000000002, -71.807500000000005), connectedTo:[
Connection(otherPoint:23, distance:0.0270001163025838), 
Connection(otherPoint:32, distance:0.0296660838260371), 
Connection(otherPoint:35, distance:0.0314949359432405), 
Connection(otherPoint:36, distance:0.0212218050886706), 
Connection(otherPoint:56, distance:0.0181771273770323), 
Connection(otherPoint:65, distance:0.0436162817468869), 
]),
Location( pointNumber:67, name:"110", coordinates: (42.239170000000001, -71.806079999999994), connectedTo:[
Connection(otherPoint:34, distance:0.0505730777110102), 
Connection(otherPoint:36, distance:0.0618402591133919), 
Connection(otherPoint:41, distance:0.0258429758672587), 
Connection(otherPoint:42, distance:0.028910141522383), 
Connection(otherPoint:43, distance:0.0261740067054946), 
]),
Location( pointNumber:68, name:"111", coordinates: (42.23865, -71.807249999999996), connectedTo:[
Connection(otherPoint:30, distance:0.0328280086886258), 
Connection(otherPoint:31, distance:0.0299906987522657), 
Connection(otherPoint:37, distance:0.0200529234834643), 
Connection(otherPoint:69, distance:0.0528793837423254), 
Connection(otherPoint:76, distance:0.0262848532426574), 
]),
Location( pointNumber:69, name:"112", coordinates: (42.237900000000003, -71.807050000000004), connectedTo:[
Connection(otherPoint:29, distance:0.0171509943426787), 
Connection(otherPoint:38, distance:0.0144009923609322), 
Connection(otherPoint:68, distance:0.0528793837423254), 
]),
Location( pointNumber:70, name:"113", coordinates: (42.238419999999998, -71.806579999999997), connectedTo:[
Connection(otherPoint:37, distance:0.0177874728878314), 
Connection(otherPoint:40, distance:0.0147775727127772), 
Connection(otherPoint:71, distance:0.0359769482549747), 
]),
Location( pointNumber:71, name:"114", coordinates: (42.237900000000003, -71.806565000000006), connectedTo:[
Connection(otherPoint:38, distance:0.0104617369052516), 
Connection(otherPoint:39, distance:0.0069356272171484), 
Connection(otherPoint:70, distance:0.0359769482549747), 
]),
Location( pointNumber:72, name:"115", coordinates: (42.237699999999997, -71.805400000000006), connectedTo:[
Connection(otherPoint:48, distance:0.0217669903611882), 
Connection(otherPoint:49, distance:0.0239661186196972), 
Connection(otherPoint:73, distance:0.0665055420961626), 
]),
Location( pointNumber:73, name:"116", coordinates: (42.23865, -71.805199999999999), connectedTo:[
Connection(otherPoint:42, distance:0.0291584422555579), 
Connection(otherPoint:46, distance:0.0289505562923335), 
Connection(otherPoint:47, distance:0.0239883739728549), 
Connection(otherPoint:72, distance:0.0665055420961626), 
]),
Location( pointNumber:74, name:"117", coordinates: (42.237099999999998, -71.805099999999996), connectedTo:[
Connection(otherPoint:52, distance:0.0198627175499614), 
Connection(otherPoint:53, distance:0.0340598107007502), 
]),
Location( pointNumber:75, name:"118", coordinates: (42.238669999999999, -71.808199999999999), connectedTo:[
Connection(otherPoint:24, distance:0.0201662441539694), 
Connection(otherPoint:61, distance:0.0486943000232403), 
Connection(otherPoint:64, distance:0.0209085782639696), 
]),
Location( pointNumber:76, name:"119", coordinates: (42.23903, -71.807249999999996), connectedTo:[
Connection(otherPoint:24, distance:0.063894709167475), 
Connection(otherPoint:36, distance:0.0166718957725726), 
Connection(otherPoint:68, distance:0.0262848532426574), 
]),
Location( pointNumber:77, name:"120", coordinates: (42.23865, -71.809723000000005), connectedTo:[
Connection(otherPoint:15, distance:0.0093380399678056), 
Connection(otherPoint:57, distance:0.0331556071808403), 
Connection(otherPoint:58, distance:0.0126490236680705), 
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
("Current Location", -1),
("Admissions Office", 23),
("Alumni Hall (Bridge)", 56),
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
("Fenwick Hall", 23),
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
("Health Services \u{1F912}_Loyola Hall", 43),
("Healy Hall (Back)", 30),
("Healy Hall (Front)", 29),
("Hogan Student Center (3rd Floor)", 27),
("Hogan Student Center (Easy Street Entrance)", 28),
("Hogan Student Center (Front)", 26),
("Kimball (Front) \u{1F35D}", 22),
("Kimball (Lower) \u{1F371}", 33),
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
("Seelos Theater \u{1F39F}", 33),
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
