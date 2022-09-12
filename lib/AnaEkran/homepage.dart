import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibersozluk/AnaEkran/favoriler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allWords = [
    {
      "turkce_terim": "Antivirüs",
      "turkce_aciklama":
          "Virüsleri ve diğer kötü amaçlı yazılım türlerini algılamak, durdurmak ve kaldırmak için tasarlanmış yazılım.",
      "eng_terim": "Antivirus",
      "eng_aciklama":
          "Software that is designed to detect, stop and remove viruses and other kinds of malicious software."
    },
    {
      "turkce_terim": "İzin Verilenler Listesi",
      "turkce_aciklama":
          "Sistemleri potansiyel olarak zararlı uygulamalardan korumak için onaylanmış uygulamaları, kuruluşlar içinde kullanmak üzere yetkilendirmek.",
      "eng_terim": "Allowed List",
      "eng_aciklama":
          "Authorising approved applications for use within organisations in order to protect systems from potentially harmful applications."
    },
    {
      "turkce_terim": "Saldırgan",
      "turkce_aciklama":
          "Bilgilerini değiştirmek, yok etmek, çalmak veya devre dışı bırakmak amacıyla bilgisayar sistemlerinden yararlanmaya çalışan kötü niyetli aktör.",
      "eng_terim": "Attacker",
      "eng_aciklama":
          "Malicious actor who seeks to exploit computer systems with the intent to change, destroy, steal or disable their information, and then exploit the outcome."
    },
    {
      "turkce_terim": "Botnet",
      "turkce_aciklama":
          "İnternete bağlı virüslü cihazlardan oluşan bir ağ, sahiplerinin bilgisi olmadan koordineli siber saldırılar yapmak için kullanılır.",
      "eng_terim": "Botnet",
      "eng_aciklama":
          "A network of infected devices, connected to the Internet, used to commit coordinated cyber attacks without their owner's knowledge."
    },
    {
      "turkce_terim": "İhlal",
      "turkce_aciklama":
          "Verilere, bilgisayar sistemlerine veya ağlara yetkisiz bir şekilde erişildiği veya etkilendiği bir olay.",
      "eng_terim": "Breach",
      "eng_aciklama":
          "An incident in which data, computer systems or networks are accessed or affected in a non-authorised way."
    },
    {
      "turkce_terim": "Kaba Kuvvet Saldırısı",
      "turkce_aciklama":
          "Genellikle şifreleri keşfetmek ve erişim elde etmek için çok sayıda değer kombinasyonunu otomatik olarak girmek için bir hesaplama gücü kullanmak.",
      "eng_terim": "Brute Force Attack",
      "eng_aciklama":
          "Using a computational power to automatically enter a huge number of combination of values, usually in order to discover passwords and gain access."
    },
    {
      "turkce_terim": "Sertifika",
      "turkce_aciklama":
          "Bir bilgisayar, kullanıcı veya kuruluş için kimlik doğrulama ve güvenli bilgi alışverişine izin veren bir dijital kimlik biçimi.",
      "eng_terim": "Certificate",
      "eng_aciklama":
          "A form of digital identity for a computer, user or organisation to allow the authentication and secure exchange of information."
    },
    {
      "turkce_terim": "Kimlik Bilgileri",
      "turkce_aciklama":
          "Bir kullanıcının kimliği doğrulamak için kullanılan kimlik doğrulama bilgileri - genellikle bir veya daha fazla parola, belirteç, sertifika.",
      "eng_terim": "Credentials",
      "eng_aciklama":
          "A user's authentication information used to verify identity - typically one, or more, of password, token, certificate."
    },
    {
      "turkce_terim": "Siber Saldırı",
      "turkce_aciklama":
          "Siber yollarla bilgisayar sistemlerine, ağlara veya cihazlara zarar vermeye, bozmaya veya yetkisiz erişim sağlamaya yönelik kötü niyetli girişimler.",
      "eng_terim": "Cyber Attack",
      "eng_aciklama":
          "Malicious attempts to damage, disrupt or gain unauthorised access to computer systems, networks or devices, via cyber means."
    },
    {
      "turkce_terim": "Siber Olay",
      "turkce_aciklama":
          "Bir sistem veya hizmet için güvenlik kurallarının ihlali - en yaygın olarak;\r\nBir sisteme ve/veya verilere yetkisiz erişim elde etme girişimleri.\r\nVerilerin işlenmesi veya saklanması için sistemlerin yetkisiz kullanımı.\r\nSistem sahiplerinin izni olmadan bir sistem donanım yazılımında, yazılımında veya donanımında yapılan değişiklikler.\r\nKötü amaçlı kesinti ve/veya hizmet reddi.",
      "eng_terim": "Cyber Incident",
      "eng_aciklama":
          "A breach of the security rules for a system or service - most commonly;\r\nAttempts to gain unauthorised access to a system and/or to data.\r\nUnauthorised use of systems for the processing or storing of data.\r\nChanges to a systems firmware, software or hardware without the system owners consent.\r\nMalicious disruption and/or denial of service."
    },
    {
      "turkce_terim": "Siber Güvenlik",
      "turkce_aciklama":
          "Cihazların, hizmetlerin ve ağların ve bunlarla ilgili bilgilerin hırsızlığa veya hasara karşı korunması.",
      "eng_terim": "Cyber Security",
      "eng_aciklama":
          "The protection of devices, services and networks — and the information on them — from theft or damage."
    },
    {
      "turkce_terim": "Beklemedeki Veriler",
      "turkce_aciklama":
          "Sabit diskler, çıkarılabilir medya veya yedeklemeler gibi kalıcı depolamadaki verileri tanımlar.",
      "eng_terim": "Data at Rest",
      "eng_aciklama":
          "Describes data in persistent storage such as hard disks, removable media or backups."
    },
    {
      "turkce_terim": "Reddetme Listesi",
      "turkce_aciklama":
          "Adlandırılmış varlıkların bir bilgisayar, site veya ağ ile iletişim kurmasını engelleyen bir erişim kontrol mekanizması.",
      "eng_terim": "Deny List",
      "eng_aciklama":
          "An access control mechanism that blocks named entities from communicating with a computer, site or network."
    },
    {
      "turkce_terim": "Sözlük Saldırısı",
      "turkce_aciklama":
          "Saldırganın tahmin olarak bilinen sözlük sözcüklerini, sözcük öbeklerini veya yaygın parolaları kullandığı bir tür kaba kuvvet saldırısı.",
      "eng_terim": "Dictionary Attack",
      "eng_aciklama":
          "A type of brute force attack in which the attacker uses known dictionary words, phrases or common passwords as their guesses."
    },
    {
      "turkce_terim": "Dijital Ayak İzi",
      "turkce_aciklama":
          "Bir kullanıcının çevrimiçi etkinliğinin geride bıraktığı dijital bilgilerin 'ayak izi'.",
      "eng_terim": "Digital Footprint",
      "eng_aciklama":
          "A 'footprint' of digital information that a user's online activity leaves behind."
    },
    {
      "turkce_terim": "Hizmet Reddi",
      "turkce_aciklama":
          "Meşru kullanıcıların bilgisayar hizmetlerine (veya kaynaklarına) erişimi, genellikle hizmeti isteklerle aşırı yükleyerek reddedilmesidir.",
      "eng_terim": "Denial of Service",
      "eng_kısaltma": "DoS",
      "eng_aciklama":
          "When legitimate users are denied access to computer services (or resources), usually by overloading the service with requests."
    },
    {
      "turkce_terim": "Saldırıyı İndir",
      "turkce_aciklama":
          "Kullanıcının bilgisi veya onayı olmadan bir cihaza kasıtsız olarak kötü amaçlı yazılım veya virüs yüklenmesi.",
      "eng_terim": "Download Attack",
      "eng_aciklama":
          "The unintentional installation of malicious software or virus onto a device without the users knowledge or consent."
    },
    {
      "turkce_terim": "Şifreleme",
      "turkce_aciklama":
          "Şifreyi çözecek anahtarı olanlar dışında herkes tarafından okunamaz hale getirerek bilgiyi koruyan matematiksel bir işlev.",
      "eng_terim": "Encryption",
      "eng_aciklama":
          "A mathematical function that protects information by making it unreadable by everyone except those with the key to decode it."
    },
    {
      "turkce_terim": "Faydalanmak",
      "turkce_aciklama":
          "İstenmeyen sonuçlara neden olmak için bir sistemdeki bir güvenlik açığından yararlanan yazılım veya verilere atıfta bulunabilir.",
      "eng_terim": "Exploit",
      "eng_aciklama":
          "May refer to software or data that takes advantage of a vulnerability in a system to cause unintended consequences."
    },
    {
      "turkce_terim": "Güvenlik Duvarı",
      "turkce_aciklama":
          "Bir ağa veya ağa yetkisiz erişimi engellemek için ağ trafiğini kısıtlamak için tanımlanmış bir kural kümesi kullanan donanım veya yazılım.",
      "eng_terim": "Firewall",
      "eng_aciklama":
          "Hardware or software which uses a defined rule set to constrain network traffic to prevent unauthorised access to or from a network."
    },
    {
      "turkce_terim": "Bilgisayar Korsanı",
      "turkce_aciklama":
          "Genel kullanımda, bazı bilgisayar becerilerine sahip olan ve bunları bilgisayarlara, sistemlere ve ağlara girmek için kullanan biri.",
      "eng_terim": "Hacker",
      "eng_aciklama":
          "In mainstream use as being someone with some computer skills who uses them to break into computers, systems and networks."
    },
    {
      "turkce_terim": "Bal Küpü (bal)",
      "turkce_aciklama":
          "Bir saldırıyı algılayarak ve saptırarak veya ondan öğrenerek gerçek sistemlere erişimi sınırlamaya yardımcı olan potansiyel saldırganları çekmek için sistemi veya ağı tuzağa düşürmek.",
      "eng_terim": "Honeypot (honeynet)",
      "eng_aciklama":
          "Decoy system or network to attract potential attackers that helps limit access to actual systems by detecting and deflecting or learning from an attack. Multiple honeypots form a honeynet."
    },
    {
      "turkce_terim": "Olay",
      "turkce_aciklama":
          "Bir sistem veya hizmet için güvenlik kurallarının ihlali, örneğin:\r\nbir sisteme ve/veya verilere yetkisiz erişim elde etme girişimleri,\r\nverilerin işlenmesi veya saklanması için sistemlerin yetkisiz kullanımı,\r\nsistem sahiplerinin izni olmadan bir sistem donanım yazılımında, yazılımında veya donanımında yapılan değişiklikler,\r\nkötü niyetli kesinti ve/veya hizmet reddi",
      "eng_terim": "Incident",
      "eng_aciklama":
          "A breach of the security rules for a system or service, such as:\r\nattempts to gain unauthorised access to a system and/or data,\r\nunauthorised use of systems for the processing or storing of data,\r\nchanges to a systems firmware, software or hardware without the system owners consent,\r\nmalicious disruption and/or denial of service"
    },
    {
      "turkce_terim": "İçeriden Öğrenilen Riskler",
      "turkce_aciklama":
          "Sistemlere, ağlara veya verilere ayrıcalıklı erişimi olan meşru bir kullanıcı tarafından kötü niyetli veya kasıtsız olarak zarar görme olasılığı.",
      "eng_terim": "Insider Risks",
      "eng_aciklama":
          "The potential for damage to be done maliciously or inadvertently by a legitimate user with privilleged access to systems, networks or data."
    },
    {
      "turkce_terim": "Makro",
      "turkce_aciklama":
          "Saldırganların bir sisteme erişmek (veya zarar vermek) için kullanabileceği uygulamalardaki (Microsoft Office gibi) görevleri otomatikleştirebilen küçük bir program.",
      "eng_terim": "Macro",
      "eng_aciklama":
          "A small program that can automate tasks in applications (such as Microsoft Office) which attackers can use to gain access to (or harm) a system."
    },
    {
      "turkce_terim": "Kötü Amaçlı Reklam",
      "turkce_aciklama":
          "Kötü amaçlı yazılımlar için bir dağıtım yöntemi olarak çevrimiçi reklamcılığı kullanma.",
      "eng_terim": "Malvertising",
      "eng_aciklama":
          "Using online advertising as a delivery method for malware."
    },
    {
      "turkce_terim": "Kötü Amaçlı Yazılım",
      "turkce_aciklama":
          "Kötü amaçlı yazılım - virüsleri, truva atlarını, solucanları veya kuruluşlar veya bireyler üzerinde olumsuz etkisi olabilecek herhangi bir kod veya içeriği içeren bir terim.",
      "eng_terim": "Malware",
      "eng_aciklama":
          "Malicious software - a term that includes viruses, trojans, worms or any code or content that could have an adverse impact on organisations or individuals."
    },
    {
      "turkce_terim": "Yama",
      "turkce_aciklama":
          "Güvenliği artırmak ve/veya işlevselliği geliştirmek için bellenim veya yazılıma güncellemeler uygulamak.",
      "eng_terim": "Patching",
      "eng_aciklama":
          "Applying updates to firmware or software to improve security and/or enhance functionality."
    },
    {
      "turkce_terim": "Sızma Testi",
      "turkce_aciklama":
          "Penetrasyon testinin kısaltması. Bir bilgisayar ağının veya güvenlik zayıflıklarının giderilebilmesi için aramak üzere tasarlanmış yetkili bir testi.",
      "eng_terim": "Pentest",
      "eng_aciklama":
          "Short for penetration test. An authorised test of a computer network or system designed to look for security weaknesses so that they can be fixed."
    },
    {
      "turkce_terim": "Site Trafiği Yönlendirme",
      "turkce_aciklama":
          "Kullanıcının doğru adresi girmesine rağmen, kullanıcının yasal olmayan bir web sitesine yeniden yönlendirilmesine neden olan ağ altyapısına yönelik bir saldırı.",
      "eng_terim": "Pharming",
      "eng_aciklama":
          "An attack on network infrastructure that results in a user being redirected to an illegitimate website despite the user having entered the correct address."
    },
    {
      "turkce_terim": "e-dolandırıcılık",
      "turkce_aciklama":
          "Hassas bilgileri (banka bilgileri gibi) isteyen veya onları sahte bir web sitesini ziyaret etmeye teşvik eden birçok kişiye gönderilen hedefsiz, toplu e-postalar.",
      "eng_terim": "Phishing",
      "eng_aciklama":
          "Untargeted, mass emails sent to many people asking for sensitive information (such as bank details) or encouraging them to visit a fake website."
    },
    {
      "turkce_terim": "Fidye Yazılımı",
      "turkce_aciklama":
          "Kurban ödeme yapana kadar verileri veya sistemleri kullanılamaz hale getiren kötü amaçlı yazılım.",
      "eng_terim": "Ransomware",
      "eng_aciklama":
          "Malicious software that makes data or systems unusable until the victim makes a payment."
    },
    {
      "turkce_terim": "Hizmet Olarak Yazılım",
      "turkce_aciklama":
          "Tüketicilerin İnternet üzerinden merkezi olarak barındırılan yazılım uygulamalarına eriştiği bir iş modelini tanımlar.",
      "eng_terim": "Software as a Service",
      "eng_kısaltma": "SaaS",
      "eng_aciklama":
          "Describes a business model where consumers access centrally-hosted software applications over the Internet."
    },
    {
      "turkce_terim": "Sanitasyon",
      "turkce_aciklama":
          "Verileri bellekten güvenli bir şekilde silmek veya kaldırmak için elektronik veya fiziksel imha yöntemlerini kullanmak.",
      "eng_terim": "Sanitisation",
      "eng_aciklama":
          "Using electronic or physical destruction methods to securely erase or remove data from memory."
    },
    {
      "turkce_terim": "Smishing",
      "turkce_aciklama":
          "SMS yoluyla kimlik avı: Kullanıcılara hassas bilgiler (ör. banka bilgileri) soran veya onları sahte bir web sitesini ziyaret etmeye teşvik eden toplu metin mesajları.",
      "eng_terim": "Smishing",
      "eng_aciklama":
          "Phishing via SMS: mass text messages sent to users asking for sensitive information (eg bank details) or encouraging them to visit a fake website."
    },
    {
      "turkce_terim": "Sosyal Mühendislik",
      "turkce_aciklama":
          "İnsanları belirli eylemleri gerçekleştirmeleri veya bir saldırganın işine yarayacak bilgileri ifşa etmeleri için manipüle etmek.",
      "eng_terim": "Social Engineering",
      "eng_aciklama":
          "Manipulating people into carrying out specific actions, or divulging information, that's of use to an attacker."
    },
    {
      "turkce_terim": "Yemleme Kancası",
      "turkce_aciklama":
          "E-postanın, alıcının tanıdığı ve/veya güvendiği bir kişiden geliyormuş gibi görünecek şekilde tasarlandığı, daha hedefli bir kimlik avı biçimi.",
      "eng_terim": "Spear-Phishing",
      "eng_aciklama":
          "A more targeted form of phishing, where the email is designed to look like it's from a person the recipient knows and/or trusts."
    },
    {
      "turkce_terim": "Truva Atı",
      "turkce_aciklama":
          "Mağdurun bilgisayarına girmek için kullanılan, meşru yazılım kılığında bir tür kötü amaçlı yazılım veya virüs.",
      "eng_terim": "Trojan",
      "eng_aciklama":
          "A type of malware or virus disguised as legitimate software, that is used to hack into the victim's computer."
    },
    {
      "turkce_terim": "Virüs",
      "turkce_aciklama":
          "Kendi kendini kopyalayabilen ve meşru yazılım programlarına veya sistemlerine bulaşmak üzere tasarlanmış programlar. Bir tür kötü amaçlı yazılım.",
      "eng_terim": "Virus",
      "eng_aciklama":
          "Programs which can self-replicate and are designed to infect legitimate software programs or systems. A form of malware."
    },
    {
      "turkce_terim": "Sana Özel Ağ",
      "turkce_aciklama":
          "Örneğin, birden fazla konumda ofisleri olan bir kuruluşta, uzak kullanıcılar için güvenli bağlantılara izin vermek için genellikle oluşturulan şifreli bir ağ.",
      "eng_terim": "Virtual Private Network",
      "eng_kısaltma": "VPN",
      "eng_aciklama":
          "An encrypted network often created to allow secure connections for remote users, for example in an organisation with offices in multiple locations."
    },
    {
      "turkce_terim": "Güvenlik Açığı",
      "turkce_aciklama":
          "Yazılım, sistem veya süreçteki bir zayıflık veya kusur. Saldırganın, bir sisteme yetkisiz erişim elde etmek için bir güvenlik açığından yararlanmaya çalışması.",
      "eng_terim": "Vulnerability",
      "eng_aciklama":
          "A weakness, or flaw, in software, a system or process. An attacker may seek to exploit a vulnerability to gain unauthorised access to a system."
    },
    {
      "turkce_terim": "Su Deliği (su deliği saldırısı)",
      "turkce_aciklama":
          "Ziyaret eden kullanıcılardan yararlanmak için sahte bir web sitesi kurmak (veya gerçek bir web sitesini tehlikeye atmak).",
      "eng_terim": "Water-holing (watering hole attack)",
      "eng_aciklama":
          "Setting up a fake website (or compromising a real one) in order to exploit visiting users."
    },
    {
      "turkce_terim": "Balina Avı",
      "turkce_aciklama":
          "Üst düzey yöneticileri hedefleyen, yüksek düzeyde hedeflenmiş kimlik avı saldırıları (meşru e-postalar gibi görünen).",
      "eng_terim": "Whaling",
      "eng_aciklama":
          "Highly targeted phishing attacks (masquerading as a legitimate emails) that are aimed at senior executives."
    },
    {
      "turkce_terim": "Sıfır-Gün",
      "turkce_aciklama":
          "Bilgisayar korsanlarının yararlanabileceği, satıcılar veya antivirüs şirketleri tarafından henüz bilinmeyen, yakın zamanda keşfedilen güvenlik açıkları (veya hatalar).",
      "eng_terim": "Zero-Day",
      "eng_aciklama":
          "Recently discovered vulnerabilities (or bugs), not yet known to vendors or antivirus companies, that hackers can exploit."
    },
    {
      "eng_terim": "Procure Secure",
      "eng_aciklama":
          "A practical guide aimed at the procurement and governance of cloud services.",
      "turkce_terim": "Güvenli Tedarik",
      "turkce_aciklama":
          "Bulut hizmetlerinin satın alınmasını ve yönetilmesini amaçlayan pratik bir kılavuz. Bu kılavuz, güvenliğin izlenmesi hakkında sorulacak sorular hakkında tavsiyeler sağlar."
    },
    {
      "eng_terim": "Resilience of the Internet Interconnection Ecosystem",
      "KISALTMA": "İnter-X",
      "eng_aciklama":
          "The \"Inter-X: Resilience of the Internet Interconnection Ecosystem\" project at ENISA is interested in the resilience of the system of interconnections between Internet networks.",
      "turkce_terim": "İnternet Ara bağlantı Ekosisteminin Esnekliği",
      "turkce_aciklama":
          "İnternet ağları arasındaki ara bağlantı sisteminin esnekliği ile ilgilenmektedir."
    },
    {
      "eng_terim": "Encrypted Traffic Analysis",
      "eng_aciklama":
          "This report explores the current state of affairs in Encrypted Traffic Analysis and in particular discusses research and methods in 6 key use cases; viz. application identification, network analytics, user information identification, detection of encrypted malware, file/device/website/location fingerprinting and DNS tunnelling detection.",
      "turkce_terim": "Şifreli Trafik Analizi   ",
      "turkce_aciklama":
          "Bu rapor, Şifreli Trafik Analizindeki mevcut durumu araştırıyor ve özellikle 6 anahtar kullanım örneğindeki araştırma ve yöntemleri tartışıyor. Bunlar; uygulama tanımlama, ağ analitiği, kullanıcı bilgileri tanımlama, şifreli kötü amaçlı yazılım algılama, dosya/cihaz/web sitesi/konum parmak izi ve DNS tüneli algılama."
    },
    {
      "eng_terim":
          "Distributed Ledger Technology & Cybersecurity - Improving information security in the financial sector",
      "eng_aciklama":
          "This paper aims to provide financial professionals in both business and technology roles with an assessment of the various benefits and challenges that their institutions may encounter when implementing a distributed ledger",
      "turkce_terim":
          "Dağıtılmış Defter Teknolojisi ve Siber Güvenlik - Finans Sektöründe Bilgi Güvenliğinin İyileştirilmesi",
      "turkce_aciklama":
          "Bu belge, hem iş hem de teknoloji rollerindeki finans uzmanlarına, kurumlarının dağıtılmış bir defter kullanırken karşılaşabilecekleri çeşitli yararlar ve zorluklar hakkında bir değerlendirme sunmayı amaçlamaktadır."
    },
    {
      "eng_terim": "Security of Mobile Payments and Digital Wallets",
      "eng_aciklama":
          "The primary objective of this paper is the production of guidelines to assist mobile payment developers and mobile payment providers towards recommended security controls which if implemented would help ensure that consumers, retailers and financial institutions are all safeguarded from cyber threats. ",
      "turkce_terim": "Mobil Ödemelerin ve Dijital Cüzdanların Güvenliği",
      "turkce_aciklama":
          "Bu belgenin temel amacı, mobil ödeme geliştiricilerine ve mobil ödeme sağlayıcılarına, uygulandığı takdirde tüketicilerin, perakendecilerin ve finansal kurumların tümünün siber tehditlerden korunmasını sağlamaya yardımcı olacak, önerilen güvenlik kontrollerine yönelik kılavuz ilkelerin üretilmesidir."
    },
    {
      "eng_terim":
          "Threat Landscape and Good Practice Guide for Software Defined Networks/5G",
      "eng_aciklama":
          "This study reviews threats and potential compromises related to the security of SDN/5G networks. More specifically, this report has identified related network assets and the security threats, challenges and risks arising for these assets. ",
      "turkce_terim":
          "Yazılım Tanımlı Ağlar/5G için Tehdit Ortamı ve İyi Uygulama Kılavuzu",
      "turkce_aciklama":
          "Bu çalışma, SDN/5G ağlarının güvenliğiyle ilgili tehditleri ve olası tavizleri incelemektedir. Daha spesifik olarak, bu rapor ilgili ağ varlıklarını ve bu varlıklar için ortaya çıkan güvenlik tehditlerini, zorluklarını ve risklerini belirlemiştir."
    },
    {
      "eng_terim": "Threat Landscape of Internet Infrastructure",
      "eng_aciklama":
          "This study details a list of good practices that aim at securing an Internet infrastructure asset from Important Specific Threats.",
      "turkce_terim": "İnternet Altyapısının Tehdit Manzarası",
      "turkce_aciklama":
          "Bu çalışma, bir İnternet altyapı varlığının Önemli Özel Tehditlerden korunmasını amaçlayan iyi uygulamaların bir listesini detaylandırmaktadır."
    },
    {
      "eng_terim": "Reactive services ",
      "eng_aciklama":
          "Reactive services usually consist in post incident reports from constituency or other events related to threats or attacks such as compromised hosts, malware, vulnerabilities or other type of similar incidents.",
      "turkce_terim": "Reaktif Servisler",
      "turkce_aciklama":
          "Reaktif servisler genellikle, seçim bölgesinden gelen olay sonrası raporlardan veya güvenliği ihlal edilmiş ana bilgisayarlar, kötü amaçlı yazılımlar, güvenlik açıkları veya diğer benzer olaylar gibi tehditler veya saldırılarla ilgili diğer olaylardan oluşur."
    },
  ];

  List<Map<String, dynamic>> _foundWords = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundWords = _allWords;
  }

  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _allWords;
    } else {
      results = _allWords
          .where((element) =>
              element['turkce_terim'].toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundWords = results;
    });
  }

  Widget _buildRow(dynamic pair) {
    final alreadyadd = _foundWords.contains(pair);

    // word-pair tile
    return ListTile(
        title: Text(pair, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(alreadyadd ? Icons.check : Icons.add,
            color: alreadyadd ? Colors.green : null),
        onTap: () {
          setState(() {
            if (alreadyadd) {
              _foundWords.remove(pair);
            } else {
              _foundWords.add(pair);
            }
          });
        });
  }

  void _pushadd() => Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _foundWords.map((dynamic pair) {
          return ListTile(
              title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
        });

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        // saved word-pair page
        return Scaffold(
            appBar: AppBar(title: Text('Saved Word-Pairs')),
            body: ListView(children: divided));
      }));

  @override
  Widget build(BuildContext context) {
    final alreadyadd = _foundWords.contains(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image(
                height: 120,
                image: AssetImage('assets/images/cyber.png'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => _filter(value),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: '  Ara...',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    // icon: Icon(
                    //   Icons.list,
                    //   color: Colors.green,
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 3.0,
                      ),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Divider(
                    color: Colors.black,
                    height: 40,
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: 40,
                  ),
                )),
                IconButton(
                  icon: Icon(Icons.menu_book),
                  onPressed: () {},
                )
              ]),
              Container(
                child: Expanded(
                    child: _foundWords.isNotEmpty
                        ? ListView.builder(
                            itemCount: _foundWords.length,
                            itemBuilder: (context, index) {
                              return Card(
                                borderOnForeground: true,
                                //key: ValueKey(_foundWords[index]['id']),

                                color: Colors.white,
                                elevation: 10,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shadowColor: Colors.blue.shade900,
                                child: ListTile(
                                  // leading: const Icon(
                                  //   Icons.stacked_line_chart,
                                  //   color: Colors.black,
                                  // ),
                                  title: Text(
                                    _foundWords[index]['turkce_terim'],
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue.shade900,
                                        fontSize: 18),
                                  ),

                                  subtitle: Text(
                                      _foundWords[index]['turkce_aciklama'],
                                      style: GoogleFonts.openSans(
                                          color: Colors.black, fontSize: 16)),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FavorilerPage(
                                                  aciklama:
                                                      "${_foundWords[index]['turkce_aciklama']}",
                                                  kelime:
                                                      "${_foundWords[index]['turkce_aciklama']}")));
                                    },
                                    icon: Icon(
                                        alreadyadd ? Icons.check : Icons.add,
                                        color:
                                            alreadyadd ? Colors.green : null),
                                    iconSize: 25,
                                    color: Colors.red,
                                    splashColor: Colors.red,
                                    //hoverColor: Colors.blue,
                                    //focusColor: Colors.green,
                                  ),
                                  /* trailing: FavoriteButton(

                                    iconSize: 40,
                                    isFavorite: false,
                                    valueChanged: (_isFavorite) {
                                      print('Is Favorite : $_isFavorite');

                                    },
                                  ),*/
                                ),
                              );
                            })
                        : const Center(
                            child: Text('Nothing Found'),
                          )),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ));
  }
}
