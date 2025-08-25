'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "24e9196fc387fafb4647d5c0fbfed746",
".git/config": "e1b4e8d625f50d5df43ef27ead3519b3",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "2736d31d9bb3992a2c101b86587f03a3",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "3845aef04aa659b4e160972b2a1870de",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "61f2cffbdc39c6270772772983cc9bb3",
".git/logs/refs/heads/gh-pages": "61f2cffbdc39c6270772772983cc9bb3",
".git/logs/refs/remotes/origin/feature/level3": "f7a0e5de66842b3de6990d80d8664cd5",
".git/logs/refs/remotes/origin/feature/weaponETC": "10dbce44f80d109039fd68b9fd8bd532",
".git/logs/refs/remotes/origin/gh-pages": "796975aab3f3f6a97b4a4f99a64227ff",
".git/logs/refs/remotes/origin/main": "05a76d3cc8f88aa5f0888ce03566998d",
".git/objects/01/0b63d8a2a61182d7d532ccd77c66580c780c21": "82123921afcc0345a1a3585eb8a246a1",
".git/objects/02/8a2d8bf67a42d5cda5d68e391587293bd3270c": "f201cadbb8fef1ea70d699e74ecea623",
".git/objects/03/0f6ff6fedf35ecbe2a15a64d450f41f0ea5769": "5ed0edb7d57d3279e37e5706c5644595",
".git/objects/03/56f37ec13a38bd9f7c89aabe396f8b490403f9": "555f80422244548231cac6c565fcb910",
".git/objects/04/bcc5db188431ae853d7e63a04976ce2efd134c": "e90a7f5d64b32d77e992e82542000f5a",
".git/objects/05/248fbe4fc23b25b164faa78bb2af35528828c6": "4058d6e5df5ceb79a5fb059efaeb038c",
".git/objects/05/556326ee25c806c0595490a8b0661223e1f320": "ada28b2ad17b01cfe272171e9a1aa85d",
".git/objects/06/964fc8f8d7cd02e4d4764fae5cc4130a6f1ca8": "a39ab4d71953a820cd17255d47e38cfc",
".git/objects/08/1533d85443b61c7dbe602672a2cc65e0c0e94f": "03e7327a7fb9272495ccc1ffb7d4279a",
".git/objects/08/37d9814ac21d071fd36e0fe0f3ac80f872f91e": "4bfff1e3e6663f5da69378b3ad8aa993",
".git/objects/08/acda04a45fb48c316f7caf361d6aca361bdb98": "2f0355cb2f5e858bf74fd32b858fb67e",
".git/objects/0a/03daab6ce01785b7d0446be5c71df963ca6da1": "b8b88eaf252a0d52a86a1bdd42985bc8",
".git/objects/0a/d2d95160ba7085d408198b8cdd51238343d83b": "d82cab66ac5e99deb2fa7bd4810a03b6",
".git/objects/0a/e93105be45658a6514a3cbbb1eec0003c4ad99": "c3da856e8a282c37b1d19a56177869a5",
".git/objects/0b/8c45813daa3e2a7f3b2db148e9040303e17c4f": "1c16410f7476643fdbd5ee1648f5467d",
".git/objects/10/565d3b117339bb3f9765a7dba12e21e0f62e70": "284a252207221276a8fe100c29135e17",
".git/objects/10/ca7d9e0f73189a823f8a4505e31d1251a57962": "937a9a91706bd1d4604aa8aca3782a50",
".git/objects/12/3e08d527391e3cfb098192aa6c0a21ff435a20": "7b1118e8e95d8f785c3dec01ebbd9377",
".git/objects/13/2474f2cca9cdee92f9e228c4a0d2bf02b289b0": "37a19b5d99d7dac62dcb17fa81c48e2d",
".git/objects/13/66ebacda86f83a1817f015bc7bad971a48bfc2": "9d3a721f2435417cd080dc21e0a2c285",
".git/objects/14/947e7730cfb9028f5ba1848674a477b477d8cb": "a3b7097e84277f4e56fe7679b83963a6",
".git/objects/15/4a6ca15c1cc7912e39ac6c4dd36598173bd7df": "02117583de05ad4c73e55262b763f6aa",
".git/objects/15/806539a35f80ca8b971d26a6dc1427cdceaf55": "55d4fd936f9a03fa4f7140529a0eb0ac",
".git/objects/16/e31cfce060aaf60871df501c733a873f132bf2": "9116ce509740db6c690a76f4de0af47f",
".git/objects/17/4fe91946d78daf33b8d9d137b8cc499e3e81e0": "f1ae04cecab50816741954d8609fd708",
".git/objects/18/947e364c1828484466f6845cc19f76e08d39a7": "4f76424437abfe974cd3151a1fc2b290",
".git/objects/19/87c7006a536ae61ea20c5afced0dd519868737": "44fa9bf8775e45d6cf60e3aee31256aa",
".git/objects/1a/4477610fd0d1a6f436aebf5c4b9b79501e2a58": "e00b3ace8456ba262838ee63322422d8",
".git/objects/1a/c8c46eb4bc167712694dd6a056a66934dd6d3f": "873edf0c08d99c59167f85eb0de2575c",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1b/6e1fa4170547119fc5ca545a18e1330d1cbdfc": "7632fd9fee16db2e14bb9f0824cd8226",
".git/objects/1d/df1f9e7c6d95a452ac342bc32f17431f167297": "38aa121f815da2102d0607a74e572207",
".git/objects/1f/f7e4bef99d49437ba1b56c8d0832856602ccf3": "ea5b276e3cf113a18bee11c64ee69d0f",
".git/objects/20/d84b6c10f745c542db37a88a9cd5da79493da0": "a993a4be75d8d65637457be513d5fbbf",
".git/objects/23/8bb95ac37f9474c31cb13feaf8f78457a87211": "6bad9651d88a9d9165b7a4f1dbbe483b",
".git/objects/23/dd7863f3322859cf59340f7a2bb7c6afedf29f": "bb5d7f8cfea78b6cdb60c9c80a001a6d",
".git/objects/24/516079280c323d34b66feeba404082a15a06a2": "0014c9658e5b5e793a92c76d5ffcff55",
".git/objects/24/dd5ae91e87a03998c753860f3306789a4018a8": "422be386171c00f4534a6bdff9347824",
".git/objects/27/0eec2a89312f21be50fe743c171c7197963df3": "3bf016c08f28ed9d7548cad50c89b8ea",
".git/objects/2b/4b4add139bf9b777ca941c39f2cb0bf792a1bd": "e5d178fb601aad875016d4780aaf78de",
".git/objects/2c/7655d860a4b98bafa47f15714ab530453ebd75": "f93637673fe60a9bbeb8d417d9885f9d",
".git/objects/2c/b5866cf7fa290bc764b80cb9b38906a7ee268a": "6fe99c1ecf44234a3d69efb614fe38eb",
".git/objects/2f/149547fdadf4da3e3f1513d9ce0905da833100": "66d27a9777403c144ca3d30592efd69a",
".git/objects/32/110c0e5947bf7a12cf6b9187eb627e9ed1933b": "6c232d1f38940ae80d85b7eb5990315b",
".git/objects/35/50a633f19ce799433c18619eaecaeccf879062": "5eb06d0977289a6c61b866642748f8b8",
".git/objects/36/520b419980f97e8e68516fb0abd31640c94c29": "8ff7c8c3f5bbdf71e8245f9a2569b46e",
".git/objects/36/6bfc2058d41f6f3b6988f0265783b3aad3b082": "33015eb75884a6ec2a04ece562b323fa",
".git/objects/36/a3a5b36c30c1d0b0d2680189988ae6b706b263": "804c66ffcd2e6cea208446261bbd7c09",
".git/objects/38/852440e157e5070a9f0859d2d938dcab1b1239": "66e96756cf060bed4f3fbbbdd5aa6c5a",
".git/objects/3a/0897d466c8e53423e5928ae655762f1f455c64": "7f7c4980deafbc2ccef8c5ba25d5de65",
".git/objects/3a/48dd14d71979976ca199ac8882d74ed7f57189": "492c9676143abe8ab927e228efb5ae84",
".git/objects/3a/c41425dd6ab4efa7666173fd330febff51bec5": "789822aafa98413e338143f9949ed6ce",
".git/objects/3b/715b321ec8b710466fbad7922972272f369e9b": "00dfcf7b8c0c4f327d38e6461a37d7ff",
".git/objects/3b/e3644fb246dac95a22a8b2be894d7dd74c22df": "bae63574c2b2e14a6aed32173bd82994",
".git/objects/3c/a229874247c107d8da61c4a4e21f02fadfe7d7": "c4be4b98f57e250f855833f2aa8003cc",
".git/objects/3e/d92954728285663aa9fa54988e15a7422fdc8e": "f78656d205395ce0dd0331d000e79b68",
".git/objects/3f/96ba4ad42da30dab12f18e58d7e5f83f99cca2": "48d021432c8ac93bc235579d41a1a215",
".git/objects/3f/a468bd4ffbb78c371b157bc83c1a97241d9b99": "2fcc34e079894d5a36d53aa42b6f8702",
".git/objects/3f/eeaa432062df0fad0b219270a82a7955b2192e": "50534c88e6429efb1927e3aa96afde4f",
".git/objects/40/e7ce7e93559a0bef7109eac8d3609c626405b5": "857bbca5b371ccb03c79f8eb55d95711",
".git/objects/40/ecdff2db8c763eae94b1762e8745b44ac5cb07": "093f42422d9c71f67462270d75036bdd",
".git/objects/41/1a837743645087fb2968f22683d809ce63131e": "4aec6ad3589a1f10c3b54d6e2c6f14f8",
".git/objects/43/4b817d51f12246a75fe43ded3b43eb5c20fda7": "34847308b8a6f0cdd620a525afe2bed5",
".git/objects/44/087a2a86c8767c2304dcafe2a8720ed07574f4": "1b397b6fe5d3bdc39f3029c696044830",
".git/objects/44/9fd554505e5b327f35bd696ca8cf077a8d85cd": "61212fe1605c58ae925493b565dc00f7",
".git/objects/45/3632eab51580c923094fe92ac6a99ac8e20020": "6495206339ff97a4da23a7b20a892d42",
".git/objects/45/448ff348f2539afc0295624175805406fcf4f3": "424b83927d2263e8d03511979a66ddd4",
".git/objects/45/a59ca24d42ff32f0b0f991b27a599564c0a129": "c3e7f3fcb12430c0814e767272c067a2",
".git/objects/46/f6d8aab572e3eaee718ac1a598a39984f26bfb": "264e3ec4b39b28e5f1d0087c17859f40",
".git/objects/47/ac49e6a5d79d1f31ce4e1675abc11b5b8d3186": "322fb903373b42486d9420277f470d90",
".git/objects/48/4c668c44b9f440af817eb3d50aab3a95a29977": "e751645f327e6b744a6ff38a974091e0",
".git/objects/4a/0a8a642734cbcc58126898cd16778e2f727c9e": "f251b6b58a1fcddc0d9c542474d3c3fb",
".git/objects/4a/f993ae5b2a13e09c69ad26782fc8c6e2b6b714": "a36d8eb5dc37b3394c7ebf9b36485eb5",
".git/objects/4b/56fe7f1a780ab8de3eb87074738d0caa397e4c": "2ae4f5b24f3691755cbaa4de91ef722f",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/4d/778543004bd7a3ce20e3ace98b6bf471d0f828": "5c2e303f99b8b2fb9c094e42601fb5cf",
".git/objects/4e/d2b16652b4f05b23f7a4e66b159762324268d7": "c78ef6dd3f7bd258cb32858a37fcc16d",
".git/objects/51/4d5985c3d04f89a4f2695390eff8083b5a00f5": "9f1319bae47bbda88b63654c071e15a4",
".git/objects/51/e81b6d7d7406ceeaeb15133deff0b1b8d5f24a": "0a2b81a22f1952aaa05ab299ed11de1c",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/53/c6bb52ff5d4f62b887919d08430dc7f6e81500": "6c3e72917817fb368ae571b678cbc9e4",
".git/objects/56/46b7e0ab48c92c49f1c1109a4c68455726eff2": "fcedb1cd2fe11b8e5adfd7e6f5dca12a",
".git/objects/58/37daacd2bb539870793ef83bb8d90051e03643": "127d427eb1f434e4be37a8f670a26113",
".git/objects/59/7972d8ba4b517db64b6b443bc36f61b491acfc": "b05b9a34a0b2701d25a0773ef95672a0",
".git/objects/5a/9f9ee394de6fd33ec9cea3e53890fde0f3c7bd": "fca803159f175874a8b798ce1091b2a6",
".git/objects/62/644894401f117545a2fa7fc7603ae3f7578492": "5ad0f4913e419a269e399446befe0c32",
".git/objects/63/932abc59b3fc402ca77357f813ae46b40f39d1": "2553e4fe74f7ab6c52d2dc592856df21",
".git/objects/63/a8168bb0b01bfdc6d11d2a3ba6cbe11f4dc004": "b22ef58d786719f708383f369b842b4b",
".git/objects/64/4dcb7288f14ccaaa001c7de65a6aad8f5c1c67": "dc1a1203104a652501e30cc7e396e9c3",
".git/objects/65/039284cb2e27c95942cfbca2a0ecce528f1f12": "cd86132aa2f2f6483f696a4fcfcf9aeb",
".git/objects/65/40f48bdb98d5d9702cade15dea5d263aff4293": "e9146fea6088401b29c9f7c03212e7ec",
".git/objects/65/55dd736827d14cf05f00aa994babe7f753c49f": "25ab3a056f7c5193dd576a58c068cacd",
".git/objects/66/0ff86aa26509643acb248c8cd85a2c041844ff": "a8a7c1f1c8230193853139cedb43a5d3",
".git/objects/66/f596b527fc7b47caf96cdb2bb3d1a6fabc80aa": "fcadf59cf283a3de23ef233b711cc1d8",
".git/objects/68/be90c702c1c7b9a781b346e1aa54402f946124": "84cb2ec1fe41d7cdd5ab297ace777220",
".git/objects/68/f0d7dbd8b6a5b94fb57fc1c127ba26c5a38345": "dcea05ec1589dda13d573f82daed92f0",
".git/objects/6b/6a5a10191e7de1c516f2566cf8bcb2fb92f8c0": "52409971e7679bd9ff063358bb910801",
".git/objects/6b/8eb208f814c6c88fe443f27dd3f94576d717a7": "7fa5eaa13a196defe7b297b2b9cea491",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6d/8e1e3064945c95792c364732669f3741cca6c5": "69f50a410ac431bf241e32239bc982cb",
".git/objects/6f/4a7f3c8a00ef2193ad5081a6e44f23033a82fd": "84479b231aa54843fdc42815ed90f748",
".git/objects/70/0f281b5d25c4395205aeac01b82664cd73a673": "93daad67783f27ce262030008fd73430",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/70/af450ca0362c8b8a8b6f663f69eee60caa3745": "8e3e13df12d5101be6dcd507b400d984",
".git/objects/71/2e2e0c21e975ab96d325e207d1be9258a66be8": "958559a2470768e7172fb8ae7d8d95ac",
".git/objects/72/3645252a3891d8367158b11ecf6d9b111c5406": "a20911d5e06579bd3b701fc91f31ee5f",
".git/objects/72/edf4806597581ec7f3fa95fb29141f92ee813c": "1517a1cc2f5cd14115ede8429a590227",
".git/objects/73/0d1757d477c14ba675c61582bd69ee2c0af9e5": "3c25e9bdb7b451f99fc905cb9cfc1f92",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/74/15b3499ce5627e82bfa7031534dec89aabd48e": "8b36bf16294eedf3a69741bf672d0426",
".git/objects/78/ef203053d303c9f4b0b6a2a7c2cc21e35f4e4f": "df4cbfc8bdcf7262607b0d5c6c214b53",
".git/objects/79/7843e97443cde00a856b052d7fe0f95e36b78a": "96bb6e0f3a2c2efb40ee5aa2f1a54ac3",
".git/objects/79/8ace8672b61e3d9526e985dd3b5fe365b1152f": "2e6a90b373737496888e962f71d54eb1",
".git/objects/7a/3c6323f3e022edcfdd7e9eade4e86b0962c27e": "88622f4b13a05b0a00ad046fa1215fcc",
".git/objects/7b/4ab9f4cdcbafc23956dba3c9a5da599e4eb417": "ee3c8a47b3fc8565f1a601cdd3ad45e6",
".git/objects/7c/bba92a49ab6f36448263462d1ff703522b3db5": "96147e33bd0b03ab00137a98fd8ac6e3",
".git/objects/7d/0b5e18e81423eac7c525c1d7dd3955addc7c2d": "68d30e8d187ff4b3bfddc931d3ac6b36",
".git/objects/7d/3baf83abf241cd68dbc51efa4a2cf7e6bef6e3": "be5604a9c0621ee63eefd28dbea11b20",
".git/objects/7d/a2b4f2fcb066daf54a6e6152748dc3ec17a3ac": "3c8e84325a6d1336164eac4919c2baa3",
".git/objects/7e/6855ad05b9e1f07a7b3c8615d5ad0f011b7fcb": "647907f7453fdc6a51765f84b4ed3bc9",
".git/objects/7e/e68ebeaffb5cef4203e36e1c93e16681617763": "b25ef43c05707e871a937370306cab8e",
".git/objects/80/33b799f152758714b4e591fba5fdc82ced342e": "c186716febf4986a7493d5e047e7f717",
".git/objects/80/be5c7e76d5c7a557aab5ced988902933393989": "3b17d7c0f6a98aa4579b7d0a736d8a45",
".git/objects/82/a78feb3d9ffaf632a39f7b13bc1a0bec6ed792": "e3f2bd84e662ae9ba09605f8b24dee7b",
".git/objects/83/0111c3c6d2d6743faa38800fff335b34f31b3e": "016bd4ee814bd3cab412be43abdfe010",
".git/objects/86/f004e56515e82373641ea625c9edcd603a8aad": "3bd2b5fed5af4791025dbd7c72ee7ab8",
".git/objects/8a/7958cd9e13d3280dc533d9a24f1415eec63d0a": "978411db980b6c92d7c79bb4f0f6b491",
".git/objects/8b/b2e0943df48bc7e02dcff5f863c113e1a11a59": "591e8949eca4f280d01a9a83f781f78a",
".git/objects/8c/21d6a1779360f53a30bb5a7d0b7aac4033eed3": "c4786edf7fa6d3fc90981250f5b29f12",
".git/objects/8c/6375f88f7d7c75d4a159066d4c93b6a2230260": "0c26748697e5113dfc62bc7159a7eb6c",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/8f/eb278ab070297b41c634b5f51210bb9e773364": "e901394256fe0be795a3b5a788e7a225",
".git/objects/90/de3810d199f151eff01900a369db949e6ada02": "6ac9ecb1cdd110d82c10be581c85dbc9",
".git/objects/93/16c294c98c187a59c58aa3bf82122e085246de": "13905d520836c0bb2909ee25896e6060",
".git/objects/93/df94cd90df81ef69a2774d4c185e5729a40f6b": "a93262ac590714d761cac4ce5a37d22a",
".git/objects/94/33ac00726a1d3d815bb04fd6150ec6f1e6956a": "4d8c8601dd342fafe1899cf3d3afe9d3",
".git/objects/95/54062b84da0fe9f7d89abefe31e0b8e54f1c26": "bbeba401399b3dee6582f41c13e8fd3b",
".git/objects/98/0df255e6cabecf2b3c4dea1a3aed7372b886cf": "5ce219b01edac5acff95178f1818c892",
".git/objects/98/e35bee196d859c4d927d53efc09b07c2d380fd": "674d9f02e54b4c057f74c24bdaf1d1f3",
".git/objects/98/e95b6a6af6b05260ab3fb92598932c9e0fead6": "9b056cb7c93f7274c1d4db4a17b7e0d6",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9b/f19366e6df7c51d2707a13274d0e493f783faa": "a3d07fe9f1b6160ac2c31c3fb94824ca",
".git/objects/9f/3bbbb8e56efa8e1c9926236533c6569f711d32": "1234b9ea45a3fa703b3a71899b17ac1c",
".git/objects/a0/57422168d900c77d93938246a5fcfec0c6a1f7": "82be34958862d9f74c33ae4decfecd18",
".git/objects/a0/ed1a869e7d089fb1c10f8336981f3ad138cebc": "6f66795bd9c1d51101d07d3b0b0bbc26",
".git/objects/a7/9ade32b94935e678a608115e4dab2dd10045de": "1b8eb53553d8835bb3a52bfb2eb1b27f",
".git/objects/a8/5d4fc664dd422f8692c30fa79b358488d10f32": "62bc8a63219dfb79eb72e878d51b6c15",
".git/objects/a9/cb03eb3486dcdac830b898f17c52154e021f94": "9fb97fc65d46dec068f972aefc7b2ba4",
".git/objects/a9/ed66c01d14173f3735a67af1f10bc201f75973": "511bfc6ccac95e527b7a7ad19f8b18e8",
".git/objects/aa/0a39e9075d95aa10ca5d4c2891e10ae3ca56c9": "085ed7199524b68494d563e0943b9f70",
".git/objects/ab/d8200e3dad669421020e40214b6baa61eba2c5": "ad1386f85962a47cb5664834a455ecad",
".git/objects/ac/391cc262e4988668abda483ea0d7eb545ede50": "7b87a737c30941079fe52a5e977ec08c",
".git/objects/ae/58ab4643969fe6874bc48f69d13ef405900c80": "73e4bcc9140c59c612949f7cdf9de21f",
".git/objects/ae/bdf302bfb37edf6e797d83a6c16ceb68f86f5d": "5a74054543b84d31bfa6cb0c13dd20b5",
".git/objects/af/2a42e3ee8937ba3ad631f462fcb325ae151055": "2c01ce448aa3e81d0d6e44945747919e",
".git/objects/af/9cc392ef84f3f617dd4bf6589669bca31e7588": "92abb415a4a1bb18fd5a33f3f3098a81",
".git/objects/b0/27e5b7f0cdbe23d9539cd54837e0bf3b3690cb": "86b114f5a87a41f812da507fb681f49e",
".git/objects/b4/310cb073bab919cd358ee4826b6af5c806147d": "6dcd939c8629aa3814678d94e71934f4",
".git/objects/b5/87bd7630b8b6340ad8d5f0f3adf8a52602cdc2": "bd9aff6693d89aae8dfc9dc20f6e3e1b",
".git/objects/b5/fadff92a9bb3e871f4bf74ab00b66e7a460fba": "0b64f94e964edf8ad2b0f4c2981d698f",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/ba/702fe3295838fe1ac7f11a682dd8da4d823d52": "6fe0a1e33793a805cfc2fa300f52c2c3",
".git/objects/bb/8dd8c1f8dd93dc69fa17e9d528740694e7e4da": "56d03c5012783fa26d524f965c2dbddd",
".git/objects/bb/eed38235133e360c835aaaee362ae4fb72ee4c": "cc9be773488ae1492f7ba0772798cad9",
".git/objects/bd/ecb2d194d9d4ba73a19a34fe0122ad6506e64e": "1a971458e4151e68dbe7355da56255ce",
".git/objects/bf/84d29ca9f828fc470d058b5caacf9be5735e55": "439a939d0e7938710bca2dd52012cb08",
".git/objects/c3/265bc60fc73a89435ec4cfbaae59ca28988be8": "32d9fbe0b386726f3476a30dfd12d9df",
".git/objects/c6/7409591b685d75fbfad77b4561423ef95162a5": "567ef583fee95510f0dde09894ddd403",
".git/objects/c7/0e66be80395bad5d4ce67c133a2788e8a6dc4b": "854ca4497a56ece9450cd3b0d755e344",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/c8/33a5e64dd1b1c8146d776543baffaf56545d61": "df47f3e37abe94d939ddb7f2ba83db99",
".git/objects/c9/e105e1655223fd193c5a90ae423d49b2ae6b40": "87da68052c78e1c4e72431e1506a5a9b",
".git/objects/c9/f50801892ef9169ff00fc78100c51b98e2ebba": "0b765a7c119971be25cd840efede9704",
".git/objects/ca/89e197a761c2890e2f1da14066b03ba26ae92b": "0c0043b219427b735fcb0f831288cb75",
".git/objects/cc/48e1cba43720dcfa843c226d0d0a094c3c389d": "35c3d0d48ec82c2099927c7918b64571",
".git/objects/cd/6b5e2251cd243b4ac8744a38ee331248ec984b": "52a2383fe795d36b37033eeea4fdbd09",
".git/objects/ce/4a39c3035e39fb68525485dadcd741466aee51": "46ba441d1792c72f170a2e09feb4f4cb",
".git/objects/d2/0163999c62f185cfa46c30ee73fdc3c25f0347": "a7c0f1740c9ecbb0bec4ed70bbcc81e4",
".git/objects/d3/f0d06022506c0d1a93868ed6921097a998927c": "df20fed12fd70b8a5bdf715a4e8de8c2",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d9/441d37661a13aa697e11a1f7b4a662b9c17729": "f67c42ba921f5f3074796130c631f360",
".git/objects/d9/4bf2cbce4def9f203b55766cb859e272c8de89": "c9d4460d1dbdf15c3c7f4fa943582a61",
".git/objects/da/68823c24be36569771b89ad9b835e306d4a885": "136082fed4f47cdb2be9ba4b82b7a85d",
".git/objects/db/0393a143fbaada364f1068af92dc98d2e8a38d": "a62f865642d0d0f3355072ee43ee3296",
".git/objects/db/3d3ddd6553a530e06d69ff62cabae9df6c37b5": "446324abb04d6f21c14fa0a736914a3e",
".git/objects/db/86116c337e9ed1c93169697f04276cd6eb60ff": "4c0404576933a8588070548f4565a63f",
".git/objects/dc/0482d867cd8265a002c499b4cb53f37347afdc": "7de46682f368b08e94da8d4261a86072",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/dc/9e0d4fc6cf017b7b403078f498ee2f3097c4c6": "faf4b936690fd7779a456991b3495116",
".git/objects/dc/bada760176af20d015e882d2c7e769a74045d5": "18d6099923afe22040e16d59603089d9",
".git/objects/dd/675b07cd0b80c1870815adaed3b3a59ea6c349": "8152725759eb68cce56a84c4d2f4fc66",
".git/objects/de/d94717ab4d7a7e882808fef6f1e383135c3473": "6f0fa91b264eed73b962744539df98ae",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e0/9e901f9aab6ec128d6f017b010e6843f33b9ea": "f350696155d511038c10fe1cbc93495d",
".git/objects/e0/b34f86f00643459ad4b1a0e3194758cac72b8b": "b45bd12aa0952f010e1ff2c02d44e354",
".git/objects/e2/1c9001649b26b99ba09c26c70476401ee6dc71": "ca0e2c36f27127c018c173c58b55cda0",
".git/objects/e4/173f9063b8f4ff4d862eb0d6518cfba283dc94": "1d6cfce32c543b3ea6bccbc8b76ab191",
".git/objects/e4/ba9ea88883394359e3efc32efba37e9895bdd7": "2ca8568f17e09ed1bbf4edb09da7f0c5",
".git/objects/e8/de31b6e345ee1598f9c6798c0263c974c6b12b": "1a77253dfc46586c1d902b23d6f0a81b",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e9/d32f3acf740008b1f5e37a2dd5109eb2e6df89": "f83237e9316982dc0455e9c9ee4391f7",
".git/objects/ea/e005922b0469fd82f8a46942bc39b5c4c4a74c": "c29e575fb1dee4141f6ca654c47fd661",
".git/objects/eb/0a24830b8e0b761814c58dc7eac38583c838b3": "2dd0fda97d4956f085ea35dda6a0f192",
".git/objects/ed/4b63b58b21a1b113d67eddc4eceb4e97cbb31d": "90c60d787c1101093db0c0b62043bbf6",
".git/objects/ed/e630fa1c3d2ab634ee20dee60beb85c331b272": "2c3a74786900c4f66e85e19ca1bcb167",
".git/objects/ee/a2bb3bf9fdac7013146376a4a7d7bfb109eac4": "608ba6f1a9fe6f856274dd7f44a13315",
".git/objects/f0/29775a4f63557c9abbae5c59e0342de61308f9": "3a3325c63e1cd3542f78ff1b7df82fb7",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/3094908771197d8aae18bfae42e9bd635d2d6e": "8f77a679da1f98f2513b1f78a1814cab",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/149a6c0604bc428eac5594fb1455a42516a267": "0f35daf3b092e66a22efa17905176a06",
".git/objects/f8/f4c8c0f1b9fa1449029cac52ce628788da2557": "da9f1fa1994be56d71707281284641f9",
".git/objects/fc/b645da43061cdf3ef7417d654fa8e8681e6caf": "ea99510e14bb3f8067f9b12d17a50527",
".git/objects/fe/67896fdcc255a57323602b030a1c3638f03074": "089d11867b3e7bbe8cebcfede26aa225",
".git/objects/ff/3a4a0ac1e6f66d07891433a63e5049429dabe5": "a575ed2e41433c1602fb448478bf6ac8",
".git/objects/pack/pack-9e649c3e6cd456ddabf9d2779924b4c028e07932.idx": "7135d72b9ba51b068e51e91385e12cf2",
".git/objects/pack/pack-9e649c3e6cd456ddabf9d2779924b4c028e07932.pack": "9526f395e3899a9e64cda2bf3b736f8c",
".git/objects/pack/pack-9e649c3e6cd456ddabf9d2779924b4c028e07932.rev": "6c4299662eb74ef5d840d484078e22a1",
".git/ORIG_HEAD": "29092956ecd63a9d8e4648009f11a117",
".git/refs/heads/gh-pages": "e425aa0e958e2016595f0fd0383ccb11",
".git/refs/remotes/origin/feature/level3": "4322980e81b026f19d1b2911545ddaff",
".git/refs/remotes/origin/feature/weaponETC": "62c90af0377ebf3cc075fcc8b40df44c",
".git/refs/remotes/origin/gh-pages": "e425aa0e958e2016595f0fd0383ccb11",
".git/refs/remotes/origin/main": "5416b53f15c78f0050bbc2207fbbc3c0",
"assets/AssetManifest.bin": "a84c93552678901660d607a569529696",
"assets/AssetManifest.bin.json": "d8e6c262674b3eec1f86de86d8f0204c",
"assets/AssetManifest.json": "9c254452fdbac9fac1111266cc141255",
"assets/assets/backgrounds/castle.png": "3d7fd049b01eb9d6b295786e620fd669",
"assets/assets/backgrounds/cliff.png": "a4686241c1d452929c48ef85effb831c",
"assets/assets/backgrounds/desert.png": "9112b1bb5228a1982c947e2cd7d26eff",
"assets/assets/backgrounds/forest.png": "508dbf605a87e593042a269038ed26f0",
"assets/assets/backgrounds/snowy_mountain_forest.png": "0f96f7109ac99e6c0cd0242999bf6430",
"assets/assets/boss_sprites/amomongo_enemy.png": "475ddfe37f44dac9b7967ce3cc5e1089",
"assets/assets/boss_sprites/buwaya_enemy.png": "bb142d8503d305bba3d784e25ec87377",
"assets/assets/boss_sprites/kaperosa_enemy.png": "f58c6d60f73e0fdb2bef46f5fa53e61a",
"assets/assets/boss_sprites/lukas_enemy.png": "de20367efb550dd52c0803504e8d2e89",
"assets/assets/card_icons/boss_action_16.png": "32ac4978e082715a439c1e4f747e6590",
"assets/assets/card_icons/boss_action_32.png": "5b2027df91a1d76c09585bec2f3076bf",
"assets/assets/card_icons/consumable_16.png": "1bda076b48370805a695807d0bbd304f",
"assets/assets/card_icons/consumable_32.png": "9830b9833aa1c3d72ca5b529beea806c",
"assets/assets/card_icons/equipment_16.png": "9ab6b67cb930d43aa4101447fe1a7acc",
"assets/assets/card_icons/equipment_32.png": "165671b3707d3a97f973f8fdc42a5567",
"assets/assets/card_icons/monster_16.png": "6183f850714367e0a3f97d9c59f87acb",
"assets/assets/card_icons/monster_32.png": "2edb58b468a72351bca284700495359e",
"assets/assets/card_icons/player_action_16.png": "32ac4978e082715a439c1e4f747e6590",
"assets/assets/card_icons/player_action_32.png": "5b2027df91a1d76c09585bec2f3076bf",
"assets/assets/card_icons/player_equipment_16.png": "9ab6b67cb930d43aa4101447fe1a7acc",
"assets/assets/card_icons/player_equipment_32.png": "165671b3707d3a97f973f8fdc42a5567",
"assets/assets/card_icons/weapon_16.png": "0064ec92dfd2a22344226207c2959fdb",
"assets/assets/card_icons/weapon_32.png": "40e5c28b858de1738f4dab1ab0437445",
"assets/assets/card_sprites/boss_action/acid_belch.png": "6e3b85fa1a4b308a53b8dea80890dafb",
"assets/assets/card_sprites/boss_action/all_out_attack.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/boss_action/angelic_respite.png": "8d5f8dbb196d04ccdfc1593dd56be42b",
"assets/assets/card_sprites/boss_action/body_possession.png": "4ea44530166e04d58571f0cede088b02",
"assets/assets/card_sprites/boss_action/cursed_bells.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/boss_action/cyclone.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/boss_action/divine_smite.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/boss_action/ectoplasm_slam.png": "92bb18d7a8716c11638e88604abce771",
"assets/assets/card_sprites/boss_action/enhance_weapon.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/boss_action/finishing_blow.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/boss_action/freezing_breath.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/boss_action/haunting_dreams.png": "dfb910f46bca6fd456c88cfbee2a1d00",
"assets/assets/card_sprites/boss_action/intimidation_tactic.png": "d0a7ad92c23cb02b09350038e63fd965",
"assets/assets/card_sprites/boss_action/life_drain.png": "157cf1cc3b05980880b8182507ed0609",
"assets/assets/card_sprites/boss_action/mass_healing_ward.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/boss_action/melting_chomp.png": "c4ddfd8d2d83defb7e9cdfaedba9e543",
"assets/assets/card_sprites/boss_action/metal_scale.png": "c4665ea9cc7fa01a529285b3446b6abe",
"assets/assets/card_sprites/boss_action/misty_footwork.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/boss_action/necrotic_rebirth.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/boss_action/phantom_attack.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/boss_action/photosynthesis.png": "aab338faa5bf51d3632daba82cf9ba9f",
"assets/assets/card_sprites/boss_action/poisonous_miasma.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/boss_action/quick_attack.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/boss_action/rally.png": "d0cf2337d857f566ce1fbe531bd82c30",
"assets/assets/card_sprites/boss_action/reckless_attack.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/boss_action/relentless_bites.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/boss_action/riposte.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/boss_action/second_wind.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/boss_action/slam.png": "cf9b9eb44a51cb1fc37ab598bed9cc6f",
"assets/assets/card_sprites/boss_action/soul_eater.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/boss_action/tail_swipe.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/boss_action/toxic_breath.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/consumable/arcana_elixir.png": "fe7a89063647282a97df90478cab7fc3",
"assets/assets/card_sprites/consumable/ash_draught.png": "5a7e8d4e5c0f31d15cd99bc33f5d4a34",
"assets/assets/card_sprites/consumable/azure_elixir.png": "315e182954e931693f45faf6f5217da9",
"assets/assets/card_sprites/consumable/crimson_serum.png": "76eacbeb3a2cb387ea169cdbeef63e42",
"assets/assets/card_sprites/consumable/enigma_tonic.png": "f0c3af64d454186670ce0f57e3a1b243",
"assets/assets/card_sprites/consumable/ether_grey_tonic.png": "09d04e93a14612f98ae9eb5bd302b36a",
"assets/assets/card_sprites/consumable/fire_vein_tonic.png": "dea278dcb32ec96d35aa0b13917632a5",
"assets/assets/card_sprites/consumable/gilded_elixir.png": "b37f106f5d8398b61bb848ea60ff7480",
"assets/assets/card_sprites/consumable/golden_tonic.png": "effcbc3075325f2b99022c595caa63e7",
"assets/assets/card_sprites/consumable/grey_matter_potion.png": "bb08682a30c50a7bf86112e390d0bb32",
"assets/assets/card_sprites/consumable/indigo_serum.png": "484a2a537dc4a9e271ca769b95fbb015",
"assets/assets/card_sprites/consumable/ivory_draught.png": "99f4dc2910de65236cdcce9dddb3a9d2",
"assets/assets/card_sprites/consumable/lavender_essence.png": "444bf27814dbba7b2c1076eb260290b7",
"assets/assets/card_sprites/consumable/ocean_mist.png": "701430226b4c3e11ca070510613fe8f1",
"assets/assets/card_sprites/consumable/purge_brew.png": "6a309ddf92f3f5ba166800a52bfaa86a",
"assets/assets/card_sprites/consumable/sol_essence.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/consumable/stone_hide_elixir.png": "34a6563f54d9656c509d0f4189341819",
"assets/assets/card_sprites/consumable/venom_brew.png": "3e7fb899bae2006d732ac2d3b1f7d090",
"assets/assets/card_sprites/consumable/verdant_elixir.png": "85016b5b98e1eaf22543980f204192e9",
"assets/assets/card_sprites/consumable/vine_brew.png": "67114202146bb733137cb4e3a64fba46",
"assets/assets/card_sprites/consumable/vitalis_potion.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/equipment/armor_of_achilles.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/equipment/celestial_aegis.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/equipment/eastern_guardian_plate.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/equipment/forest_warden_armor.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/equipment/gambelash.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/equipment/gambeson.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/equipment/hussite_plate.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/equipment/jack_of_plate.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/equipment/kalkan_breastplate.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/equipment/lamellar_armor.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/equipment/lorica_segmentata.png": "01413aaec3de17a3c55f0caac4c17a37",
"assets/assets/card_sprites/equipment/maximilian_plate.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/equipment/o_yoroi.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/equipment/pectoral_armor.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/equipment/power_breastplate.png": "ce4ea803daf9dbb4f3ff8e72f7a3f445",
"assets/assets/card_sprites/equipment/ruby_wyrmbark_breastplate.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/equipment/spirit_forged_mail.png": "fff9196a0f38dba6803208bd773409c5",
"assets/assets/card_sprites/equipment/storm_breaker_cuirass.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/equipment/storm_plate_of_tempest.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/equipment/sun_blessed_aegis.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/equipment/verdant_breastplate.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/monster/aghoy.png": "c94f86cd599ae51fee53c5f15153465b",
"assets/assets/card_sprites/monster/amaranhig.png": "9f6089c96785829767c260fe8eda8889",
"assets/assets/card_sprites/monster/amomongo.png": "faf8cf76960c9e85f53dc9292656ab01",
"assets/assets/card_sprites/monster/boar.png": "f7f08bc5a7cc3d452aa78e92f87a5957",
"assets/assets/card_sprites/monster/boar_2.png": "d11d4e14bf204012b11daa9638d4f320",
"assets/assets/card_sprites/monster/bungisngis.png": "784776b949f922fe78161ac049021776",
"assets/assets/card_sprites/monster/busaw.png": "4f55e616d8cd45f447b9c41a89b722ac",
"assets/assets/card_sprites/monster/buwaya.png": "69b1c4f2782c3f5b8d6d873c64f0045c",
"assets/assets/card_sprites/monster/chicken.png": "fe7313f754c222c6dd739609fda3537c",
"assets/assets/card_sprites/monster/dwende_blue.png": "341bbd92804c204f70618d42235dca19",
"assets/assets/card_sprites/monster/dwende_orange.png": "0d91bdd0d1a603740783f8d86d24a3dc",
"assets/assets/card_sprites/monster/dwende_red.png": "b4eb7deaa09f296a5e6dfc2fea8bffb1",
"assets/assets/card_sprites/monster/dwende_yellow.png": "28f006fe4e9ff71579ac8e7344eb1c1c",
"assets/assets/card_sprites/monster/ek_ek.png": "bbb11166cdf7e9f403c39b2d0ec102f3",
"assets/assets/card_sprites/monster/evil_dwende.png": "87ca675ff4baf9cb278851ffba90562f",
"assets/assets/card_sprites/monster/kapre.png": "bf90514a9b01f48834919b76eab787c6",
"assets/assets/card_sprites/monster/kolyog.png": "65f70f56293a475304ec4d556afaba23",
"assets/assets/card_sprites/monster/malakat.png": "cd08a506d233db67a925c2661042e38a",
"assets/assets/card_sprites/monster/manananggal.png": "24f656f78cd7807b8c0bed872b7454b6",
"assets/assets/card_sprites/monster/nuno_sa_punso.png": "d100a7f3f9ca29ae576ec7006b28ad50",
"assets/assets/card_sprites/monster/rooster.png": "7db7f2ffbf67ea860d1c095f8064e14b",
"assets/assets/card_sprites/monster/santelmo.png": "2aa9b53f8846204fa41bd34de7029a27",
"assets/assets/card_sprites/monster/sigbin.png": "f7142299358fb57ba737e321bb30bb95",
"assets/assets/card_sprites/monster/sirena.png": "eacebd490d6618d419184ba9bab9bfc4",
"assets/assets/card_sprites/monster/syokoy.png": "61d7fe4b7a93aeeb82ab59ac36e2ba37",
"assets/assets/card_sprites/monster/taong_tuod.png": "62b3bbbe18a40a175b9cf3f08d898621",
"assets/assets/card_sprites/monster/tiburones.png": "217cc243a3a7507d429a47742e5c3473",
"assets/assets/card_sprites/monster/tikbalang.png": "d183c9dfa2bc6a35ec39c3be678ee334",
"assets/assets/card_sprites/monster/tiyanak.png": "3e83536158666347ba1b1bafdce8079f",
"assets/assets/card_sprites/monster/witch.png": "73bc22228228b3ee34092fb8e9ff9e0e",
"assets/assets/card_sprites/player_action/all_out_attack.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/player_action/angelic_respite.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/player_action/blood_blade.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/player_action/bone_chill.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/player_action/cyclone.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/player_action/dark_determination.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/player_action/divine_interference.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/player_action/divine_smite.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/player_action/eldritch_contract.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/player_action/enhance_weapon.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/player_action/everbloom.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/player_action/fancy_footwork.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/player_action/finishing_blow.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/player_action/follow_up.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/player_action/haste.png": "26fac8aadd1ae8fe6f88c1a392932606",
"assets/assets/card_sprites/player_action/healing_potion.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/player_action/holy_prayers.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/player_action/ironskin_potion.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/player_action/knightly_rending.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/player_action/mass_healing_ward.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/player_action/metallica.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/player_action/misty_dodge.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/player_action/pocket_sand.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/player_action/singularity.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/player_action/soul_eater.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/player_action/weaken.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/player_equipment/amethyst_gauntlet.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/player_equipment/conquerers_armor.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/player_equipment/cursed_shield.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/player_equipment/desert_armor.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/player_equipment/emerald_gauntlet.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/player_equipment/icarus_wings.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/player_equipment/knights_breastplate.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/player_equipment/light_armor.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/player_equipment/maddening_shelter.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/player_equipment/midas_touch.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/player_equipment/monkeys_gloves.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/player_equipment/pandoras_box.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/player_equipment/superior_armor.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/player_equipment/swordsman_armor.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/player_equipment/timeless_piece.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/player_equipment/unholy_aura.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/player_equipment/vampiric_strength.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/player_equipment/vulnerability_exposer.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/weapon/bladed_nunchaku.png": "13fddf119651118456d939b855df1ebc",
"assets/assets/card_sprites/weapon/death_crescent.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/weapon/doom_spire.png": "80a526ac15347d1924ce142718c17060",
"assets/assets/card_sprites/weapon/espada_larga.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/weapon/eternal_cleaver.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/weapon/excalibur.png": "e8b28a4759843e7d67dd52e36356f679",
"assets/assets/card_sprites/weapon/fang_of_riton.png": "9153b19d780f7e249a744d61bd5c5504",
"assets/assets/card_sprites/weapon/gladius.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/weapon/khopesh.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/weapon/kokuryu.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/weapon/kris.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/weapon/morning_star.png": "f07902ce40809514b5928083541c8fe0",
"assets/assets/card_sprites/weapon/poseidon_fang.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/weapon/shadow_fang.png": "d2d443c8d21814f0d42427e8324e31a5",
"assets/assets/card_sprites/weapon/shamshir.png": "b93936a2498caded5cb7dd65332f6c71",
"assets/assets/card_sprites/weapon/shepherd_staff.png": "15896bcb34d34e37b72462fcf677887b",
"assets/assets/card_sprites/weapon/skull_splitter.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/weapon/star_forged_hammer.png": "d958ef89d461179d6ba933f136a2de03",
"assets/assets/card_sprites/weapon/stiletto.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/weapon/storm_splitter.png": "83942c9c3cafb5b4d27dda471da0d1ff",
"assets/assets/card_sprites/weapon/yamatsumi.png": "d9657f566302f918c6cb4b9a9d9de933",
"assets/assets/character_sprites/c0.png": "14a6825be7085eff942a31ab2ac29ecd",
"assets/assets/character_sprites/cole.png": "fae2e115a53253bd09fb367605473b65",
"assets/assets/character_sprites/lukas.png": "7972fe40eabb4aefac4c1e433c313f99",
"assets/assets/character_sprites/witch.png": "b8b2b817a957ce81e216e5fe86c50971",
"assets/assets/fonts/ConcertOne-Regular.ttf": "47fb27f06685e983e830e0d7c33c5e8b",
"assets/assets/sounds/bgm/boss_fight.mp3": "2630ba13223e2dc3543b3d7ef5298b7e",
"assets/assets/sounds/bgm/castle.mp3": "d7fe30d63a0dfaf69380d4d52ebb12d9",
"assets/assets/sounds/bgm/core_game.mp3": "72333186d3db2d9ffaa89a4096174f34",
"assets/assets/sounds/bgm/desert.mp3": "55115113f6c124235c85357564a95a55",
"assets/assets/sounds/bgm/forest.mp3": "5b975517a208ceffc10096c4a840db66",
"assets/assets/sounds/bgm/snowy_mountain_forest.mp3": "5b975517a208ceffc10096c4a840db66",
"assets/assets/sounds/sfx/dialogue_blips.mp3": "c4d5c8931ba171effbc45c8699f16263",
"assets/FontManifest.json": "5c9cae536d98fdc4a2c6b2f34f122166",
"assets/fonts/MaterialIcons-Regular.otf": "36475af447db2d2c736f89d6b0b4ea7a",
"assets/NOTICES": "00bae75a26f227cd28ba82e168bf4c00",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"CNAME": "87dd1a238861344d8a249112c3120fd6",
"favicon.png": "f262f49c76a5c2aa061c6544b536913d",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "0b2ba10a8e7985da9d5415419424e42a",
"icons/Icon-192.png": "bf5a344e06c8a028c499a3e6d98a54af",
"icons/Icon-512.png": "5830a844b08035310cec4cfe88804087",
"icons/Icon-maskable-192.png": "bf5a344e06c8a028c499a3e6d98a54af",
"icons/Icon-maskable-512.png": "5830a844b08035310cec4cfe88804087",
"index.html": "ef2a1043ef634a72499a5bc0579c6a7a",
"/": "ef2a1043ef634a72499a5bc0579c6a7a",
"main.dart.js": "5dedf6a10c4bf35c07189da41d9fa4e4",
"manifest.json": "57367f6be3be826514765a9dad2a8e3f",
"version.json": "9ee1524e80f68850244867748af962ff"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
