//
//  Recipes.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/31.
//

import Foundation
import UIKit


struct Ingredients{
    var name: String
    var amount: String
}

struct CookingGuide{
    var step: Int
    var guide: String
}

struct Recipe{
    let title: String
    let imageName: String
    let serving : Int
    let preparationTime : Int
    let info: String
    let ingredients: [Ingredients]
    let cookingGuide: [CookingGuide]
}
struct Recipes{
    
    static let shared = Recipes()

    func findRecipe(recipeName: String) -> Recipe {
        var item : Recipe?
        for recipe in uzbekMeals {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in westernMeals {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in desserts {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        for recipe in cakes {
            if recipeName == recipe.title {
                item = recipe
            }
        }
        return item!
    }
    
    let uzbekMeals: [Recipe] = [
      // palov
        Recipe(title: "Palov", imageName:"palov", serving: 5, preparationTime: 60, info: "Palov – bu har bir O‘zbekiston aholisi pishirishni bilishi kerak bo‘lgan an’anaviy taomdir. Ushbu mazali taom juda oddiy masalliqlardan tayyorlanadi: guruch, go‘sht, ziravorlar, sabzi va piyoz. Palov har kungi ovqat sifatida ham, bayramona taom – ayniqsa to‘y, ziyoratdan qaytish, farzandli bo‘lish, yubiley, dafn marosimi, shuningdek ehson sifatida ham dasturxonga tortiladi.", ingredients: [Ingredients(name: "Guruch", amount: "700 gram" ),Ingredients(name: "Go`sht", amount: "500 gram" ),Ingredients(name: "Yog", amount: "300 gram" ), Ingredients(name: "Sabzi", amount: "4 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Guruch bir necha marta toza suvda yuvib olinadi. So’nggi marta yuvganingizdan qolgan suv to’liq shaffof bo’lishi kerak."), CookingGuide(step: 2, guide: "Go’shtni yuvib, kubik shaklida bo’laklab oling. Piyoz va sabzi po’stidan tozalanadi. 3 ta piyoz ingichka yarimhalqa, sabzini esa uzun 1 sm`lik somoncha qilib kesib olish kerak. Sarimsoq ustki qavat po’stidan tozalanadi, lekin kichik boshchalarga bo’linmaydi."), CookingGuide(step: 3, guide: "Qozon qizdiriladi, moy solinadi va yengil tutaguncha qizdirishda davom etiladi. So’ng qolgan bitta butun piyoz solib, qorayguncha qovuriladi. So’ng olib qo’yiladi."), CookingGuide(step: 4, guide: "Endi oshning zirvagini tayyorlashga kirishiladi. Qozonga piyoz solib, u tillarang tusga kirguncha qovuriladi (taxminan 7 daqiqa). Piyoz qovurilib bo’lgach, qozonga piyoz ustidan go’sht solinadi va u qobiq hosil qilgunicha qovuriladi."), CookingGuide(step: 5, guide: "Ushbu bosqichda sabzi solinadi va aralashtirmasdan 3 daqiqa qovuriladi. So’ng barchasi 10 daqiqa vaqti-vaqti bilan aralashtirib turgan holda qovuriladi."), CookingGuide(step: 6, guide: "Zira va kashnich urug’lari ezilib, osh zirvagiga qo’shiladi. Ushbu bosqichda zirvakning tuzi rostlanadi."), CookingGuide(step: 7, guide: "Olov o’rtacha balandlikkacha pasaytiriladi va sabzi yumshoq bo’lmagunicha zirvakni pishirishda davom etiladi (yana taxminan 7-10 daqiqa). So’ng zirvakdan 3 sm baland bo’lguncha qaynoq suv solib, qaynatilgan no`xat solinadi va olov yanada pasaytirilib, 20 daqiqaga dimlab qo’yiladi."), CookingGuide(step: 8, guide: "Guruch yana bir marta yuviladi, suvi to’kib tashlanadi. Keyin zirvak ustidan bir tekis qilib yoyib chiqiladi. Olov maksimumgacha baland qilinib, guruch ustidan 3 sm baland bo’lguncha kapkirni ustidan qilib qaynoq suv solinadi."), CookingGuide(step: 9, guide: "Guruch suvni shimib olgach, unga sarimsoq botirib qo’yiladi, olov o’rtacha balandlikkacha pasaytiriladi va guruch tayyor bo’lguncha pishiriladi."), CookingGuide(step: 10, guide: "Guruchga kapkir bilan yengil urib ko’riladi. Agar bunda chiqadigan ovoz jarangdor bo’lmasa, guruchda tayoqcha yordamida qozon tubigacha bo’lgan chuqurchalar hosil qilinadi."), CookingGuide(step: 11, guide: "Guruch tekislanadi. Qozon qopqog`i yopiladi va olovni pasaytirib, 15-20 daqiqaga dimlanadi")]),
   
   
   
   Recipe(title: "Mastava", imageName:"mastava", serving: 4, preparationTime: 40, info: "Mastava - guruchdan tayyorlanadigan, suyuq taom. Asosan, suzma yoki qatiq qo`shib ichiladi va juda ham foydali taomdir. Kimdir “mastava faqat qo’y yog’ va qo’y go’shtidan tayyorlanishi kerak” deb e’tiroz bildirishi tabiy. Ishoning go’sht bu asosiysi emas to’g’ri kim uchundir qo’y go’shti mol go’shtiga nisbatan ko’proq yoqar, to’g’ri qo’y go’shti mol go’shtiga nisbatan yumshoqroq bo’lishi mumkin. Lekin biri bo’lmasa yoki yoqmasa ikkinchisidan foydalansa ham bo’laveradi.",
          ingredients: [Ingredients(name: "Guruch", amount: "100 gram" ),Ingredients(name: "Mol go`shti", amount: "300 gram" ),Ingredients(name: "Yog", amount: "100 gram" ), Ingredients(name: "Sabzi", amount: "1-2 dona" ),Ingredients(name: "Kartoshka", amount: "4 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "Pomidor", amount: "1 dona" ), Ingredients(name: "Bulg`or", amount: "1-2 dona" ), Ingredients(name: "Ko`kat", amount: "tabga ko`ra" )],
          cookingGuide: [CookingGuide(step: 1, guide: "Go’sht va barcha sabzavotlarni mayda kubik shaklida to’g’raladi va qizib turgan yog’da aval go’shtni solib qovuriladi"), CookingGuide(step: 2, guide: "Qozondagi go’shtni 3-4 daqiqa qovurib, ortidan piyoz va mastavaga rang berish uchun pomidor solib qovurishni davom ettiriladi, agar pomidor bo’lmasa o’rniga yarim osh qoshiq tomat pastasi qo’shib qovurish mumkin."), CookingGuide(step: 3, guide: "So’ngra navbat bilan sabzi, qartoshka, bulg’ori qalampiri va sarimsoq solib qovuriladi, ortidan tuz va murch qo’shib suv quyiladi."), CookingGuide(step: 4, guide: "Endi mastavaning eng muhim va nozik tomoniga e’tiborimizni qaratadigan bo’lsak bu albatta guruch xisoblanadi.Gurunchni taomni dasturxonga tortiq qilishdan tahminan 10-15 daqiqa oldin solinadi va shundagina mastavadagi guruchlar dona-dona bo’lib turadi")]),
        
        
   Recipe(title: "Qovurma lag`mon", imageName:"lagman", serving: 4, preparationTime: 60, info: "Qovurma lag’mon tayyorlash uning boshqa turlariga qaraganda kengroq tarqalgan. Chunki ushbu taomni tayyorlash uchun kamroq kuch va masalliqlar talab qilinadi. O’zbekcha qovurma lag’mon pishirishning yana bir qulayligi shundaki, uning xamiri va qaylasini muzlatgichda bir-biridan alohida ravishda saqlash mumkin, yakuniy taom esa bevosita dasturxonga tortishdan oldin yaratiladi. Qovurma lag’mon mazali chiqishi uchun cho’zma lag’mondan foydalangan ma’qul. Oddiy kesilgan xamir yoki makaronlar bunday ta’mni bera olishmaydi. Taom likopchaga suziladi, dasturxonga tortishdan oldin u yupqa qilib to’g’ralgan piyoz va ko’katlar aralashmasi bilan bezatiladi.",
          ingredients: [Ingredients(name: "Tuxum", amount: "2 dona" ),Ingredients(name: "Lag`mon xamiri", amount: "500 gram") ,Ingredients(name: "Go`sht", amount: "400 gram" ),Ingredients(name: "Yog", amount: "130 ml" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "2 dona" ), Ingredients(name: "Qalampir", amount: "1 dona" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Bulg`or", amount: "1-2 dona" ), Ingredients(name: "Murch, zira", amount: "1 choy qoshiq"), Ingredients(name: "Tomat", amount: "50 gram"), Ingredients(name: "Ko`kat va hk.", amount: "ta`bga ko`ra")],
          cookingGuide: [CookingGuide(step: 1, guide: "Go’shtni 0,5-1 sm kattalikdagi kubiklarga kesib olinadi."), CookingGuide(step: 2, guide: "Piyoz yupqa yarim halqa shaklida qilib kesiladi, bezatish uchun biroz olib qo’yish yodingizdan ko’tarilmasin. Sabzi somoncha qilib, achchiq qalampir ingichka halqa, bulg’or qalampiri va pomidor esa kubik qilib to’g’raladi. Sarimsoqning barchasi maydalab olinadi."), CookingGuide(step: 3, guide: "Tayyorlash uchun tubi qalin bo’lgan idish kerak, qozon buning uchun ayni muddao. Qozonga 120 ml o’simlik moyi solib, qizdiriladi. So’ng to’g’rab olingan go’sh qovuriladi (10-15 daqiqa yetarli), agar qattiq bo’lsa, biroz dimlab olish mumkin."), CookingGuide(step: 4, guide: "Go’sht yumshagach, ortidan piyoz, pomidor, sabzi, bulg’or va achchiq qalampir solinadi. So’ng ko’katlar qo’shiladi va barchasi qovurib olinadi."), CookingGuide(step: 5, guide: "1 choy qoshiqdan tuz, zira va maydalangan murch qo’shib, masalliqlar aralashtiriladi."), CookingGuide(step: 6, guide: "Keyin qozonga 50 g tomat pastasi solinadi. Barchasi yaxshilab aralashtiriladi."), CookingGuide(step: 7, guide: "Tayyorlash yakunida mayda qilib to’g’ralgan sarimsoq qo’shiladi. Masalliqlar yana yaxshilab aralashtirilib, chetga olib qo’yiladi."), CookingGuide(step: 8, guide: "Cho’zma lag’mon xamiri biroz tuzlangan suvda qaynatib olinadi. Pishgach, sovuq suv bilan yuvib olinadi. Xamir boshqa idishga solinib, chetga olib qo’yiladi."), CookingGuide(step: 9, guide: "Idishga 1-2 ta tuxumni chaqib solib, bir chimdim tuz sepib, yaxshilab urib olinadi."), CookingGuide(step: 10, guide: "Tovada 1-2 choy qoshiq moy qizdiriladi va aralashgan tuxum ingichka qavat qilib quyiladi. U ikki tomonidan qizartirib qovurilib olinadi va pishgach, kichik bo’lakchalarga bo’linadi yoki somoncha qilib to’g’raladi."), CookingGuide(step: 11, guide: "Pishgan tuxumga cho’zma lag’mon solinadi, ikkalasi birgalikda qovuriladi, aralashtiriladi, so’ng ular oldindan tayyorlab olingan qaylaga qo’shiladi. Taom tayyor!"),]),
        
        
        Recipe(title: "Qaynatma sho`rva", imageName: "pizza", serving: 6, preparationTime: 100, info: "Uyda barcha qoidalarga rioya qilgan holda juda mazali qaynatma sho’rva tayyorlashni maslahat beramiz. Ushbu sho’rva qo’y go’shti, sersuv sabzavotlar va xushbo’y ziravorlardan tashkil topgan. Bunday sho’rva qovurilmay tayyorlanadi, ammo bu sho’rva ta’mini buzmaydi, aksincha, unga o’zgacha maza taqdim etadi.",
               ingredients: [Ingredients(name: "Qo'y qovurg`a", amount: "500 g" ),Ingredients(name: "Mol go`sht", amount: "400 g" ),Ingredients(name: "Dumba", amount: "100 g" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "2 dona" ), Ingredients(name: "Bulg`or", amount: "3-4 dona" ), Ingredients(name: "Sarimsoq", amount: "4 bo`lakcha" ),Ingredients(name: "Kartoshka", amount: "300 g" ),Ingredients(name: "Pomidor", amount: "200 g"),Ingredients(name: "Kashnnich", amount: "1 bog`" ),Ingredients(name: "Lavr yaprog`i", amount: "3 ta" ), Ingredients(name: "Zira", amount: "20 gram"), Ingredients(name: "Murch va tuz", amount: "ta`bga ko`ra" )],
               cookingGuide: [CookingGuide(step: 1, guide: "Qozonga mol va qo'y go'shtlarini solib, ustidan 4-5 litr suv quyamiz."), CookingGuide(step: 2, guide: "Baland olovga qo'yib, qaynab chiqqanidan so'ng olovini pasaytiramiz. Ustida hosil bo'lgan ko'piklarini suzib olamiz.O'rtacha olovda sho'rva shaffof tusda bo'lishi uchun ustidagi ko'piklarini olib turgan holda, 60-90 daqiqa qaynatamiz."), CookingGuide(step: 3, guide: "Dumbani mayda to'rtburchak shaklida to'g'rab, sho'rvaga solamiz. So'ngra lavr yaprog'i va ziravorlarni solamiz (zira, kashnich, tuz va murch)."), CookingGuide(step: 4, guide: "Po'stidan tozalangan sabzavotlarni katta bo'laklarga bo'lamiz yoki butunligicha qoldiramiz. Sho'rvaga sabzi, piyoz (4 ga bo'lingan) sarimsoqpiyozni solamiz.solamiz. Maslahat: katta bo'lmagan hajmdagi kartoshkadan foydalaning"), CookingGuide(step: 5, guide: "Pomidorlarni 4 ga bo'lib, sho'rvaga solamiz."), CookingGuide(step: 6, guide: "Sariq va yashil rangli bulg'or qalampirlarini o'rtacha bo'laklarga bo'lamiz. Qizilini qirg'ichdan o'tkazamiz (rang uchun) va sho'rvaga solamiz.Qaynab chiqqanidan so'ng o'rtacha olovda kartoshka pishgunicha tahminan 30 daqiqa qaynatamiz.Ta'tib ko'rib, kerak bo'lsa tuz soling."), CookingGuide(step: 7, guide: "Sho'rva tayyor bo'lganidan so'ng, uni dasturxonga tortish uchun tayyorlaymiz. Sho'rvadan sabzavot va mol go'shtini olib, bo'laklarga bo'lamiz."), CookingGuide(step: 8, guide: "Kosalarga sabzavotlar, go'sht va 1 tadan qovurg'a qo'yib, sho'rvasidan quyamiz. Ko'katlar bilan bezatamiz.Yoqimli ishtaha!")]),
        
        
        Recipe(title: "Chuchvara sho`rva", imageName: "pizza", serving: 4, preparationTime: 40, info: "Tushlik uchun to’yimli va lazzatli sho’rva. Muzlatgichda tayyor chuchvarangiz bo’lsa, bu taom juda tez tayyorlanadi, va tezda oila a’zolaringizni to’ydirishga yordam beradi.",
               ingredients: [Ingredients(name: "Yog`", amount: "80 ml") ,Ingredients(name: "Sabzi", amount: "1 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "Bulg`or", amount: "2 dona" ), Ingredients(name: "Sarimsoq", amount: "2 bo`lakcha" ),Ingredients(name: "Kartoshka", amount: "300 g" ),Ingredients(name: "Tomat", amount: "1 osh qoshiq"),Ingredients(name: "Yanchilgan Kashnnich", amount: "1 choy qoshiq" ),Ingredients(name: "Lavr yaprog`i", amount: "2 dona" ), Ingredients(name: "Chuchvara", amount: "200 g")],
               cookingGuide: [CookingGuide(step: 1, guide: "Piyoz, sarimsoqpiyoz va kartoshkani mayda kubik shaklida to’g’raymiz."), CookingGuide(step: 2, guide: "Sabzini qir’gichdan chiqaramiz."), CookingGuide(step: 3, guide: "Chuqur tovada o’simlik yog’i qizdirib, piyoz va sarimsoqpiyozni qizartirib qovuramiz."), CookingGuide(step: 4, guide: "Kartoshka va sabzi qo’shib 2 daqiqa davomida qovuramiz."), CookingGuide(step: 5, guide: "Pomidor pastasi va ziravorlar qo’shib, aralashtiramiz va yana 2 daqiqa davomida qovuramiz."), CookingGuide(step: 6, guide: "Suv quyib, lavr yaprog’i qo’shamiz va o’rtacha olovda 20 daqiqa davomida qaynatamiz."), CookingGuide(step: 7, guide: "Chuchvara qo’shib, pishguncha 10-15 daqiqa qaynatamiz."), CookingGuide(step: 8, guide: "Tayyor sho’rvani kosalarga quyib, smetana yoki qatiq va to’g’ralgan ko’kat bilan dasturxonga tortamiz. Yoqimli ishtaha!")]),
        
        
        Recipe(title: "Moshxo`rda", imageName: "pizza", serving: 5, preparationTime: 40, info: "Quyuqqina, tobida qaynab pishgan moshxo’rda taomining retsepti.",
               ingredients: [Ingredients(name: "Mol go`sht", amount: "600 g") , Ingredients(name: "Yog`", amount: "200 ml") ,Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "2 dona" ), Ingredients(name: "Bulg`or", amount: "1-2 dona" ), Ingredients(name: "Sarimsoq", amount: "3 bo`lakcha" ),Ingredients(name: "Kartoshka", amount: "4 dona" ),Ingredients(name: "Pomidor", amount: "1 dona"),Ingredients(name: "Mosh", amount: "350 g" ),Ingredients(name: "Guruch", amount: "150 g" ), Ingredients(name: "Kashnich", amount: "0.5 choy qoshiq")],
               cookingGuide: [CookingGuide(step: 1, guide: "Barcha sabzavotlar va go'shtni bir xil kattalikda, to'rtburchak qilib to'g'raymiz."), CookingGuide(step: 2, guide: "Mosh va guruchni yaxshilab yuvib, alohida-alohida idishlarga iliq suvga ivitib qo'yamiz."), CookingGuide(step: 3, guide: "Qozonga yog'ni quyib, yaxshilab qizdirib olamiz."), CookingGuide(step: 4, guide: "Avval piyozni solib, qizartirib qovuramiz, so'ng go'shtni solib, birga qovuramiz.Tuzdan tashqari, ziravorlarning bir qismini qozonga solamiz.Bir necha daqiqa qovuramiz."), CookingGuide(step: 5, guide: "So'ng sabzi va kartoshkani solib, 2-3 daqiqa qovuramiz."), CookingGuide(step: 6, guide: "So'ng pomidor, bulg'or qalampiri va sarimsoqpiyozni solib, yana 2-3 daqiqa qovuramiz."), CookingGuide(step: 7, guide: "Ivitilgan moshni suvini to'kib, o'zini sabzavotlarning ustidan solamiz va 5 daqiqa qovuramiz."), CookingGuide(step: 8, guide: "Ustidan suv solib, qaynash darajasiga keltiramiz, olovni pasaytirib, mosh yorilgunga qadar pishiramiz. So'ng tuz va guruchni solib, tayyor bo'lguniga qadar pishiramiz."), CookingGuide(step: 9, guide: "Pishgan taomni qopqog'ini yopib, 15 daqiqa tindirib qo'yamiz va keyin suzib, iste'mol qilamiz. Yoqimli ishtaha!")])
   ]
    


   let westernMeals : [Recipe] = [
       Recipe(title: "Pizza", imageName: "pizza", serving: 2, preparationTime: 80, info: "Pitsa — italyancha taomlarning ichida eng sevimli va ommalashganlaridan biri bo’lib, butun dunyoda sevib iste’mol qilinadi. Uning mazali chiqishi nafaqat asosiga, balki uning xamiriga ham katta bog’liqdir.", ingredients: [Ingredients(name: "Tuxum", amount: "1 dona" ),Ingredients(name: "Un", amount: "300 g" ),Ingredients(name: "Margarin", amount: "100 g" ), Ingredients(name: "Shakar", amount: "1 osh qoshiq" ),Ingredients(name: "Tuz", amount: "1 choy qoshiq" ), Ingredients(name: "Xamirturush", amount: "1 osh qoshiq" ), Ingredients(name: "Pomidor", amount: "3 dona" ), Ingredients(name: "Piyoz", amount: "1 dona"), Ingredients(name: "O`simlik yog`i", amount: "100 ml"), Ingredients(name: "Tuz, Murch, Oregano", amount: "ta`bga ko`ra"), Ingredients(name: "Sarimsoq", amount: "2 bo`lakcha"), Ingredients(name: "Motsarella pishlog`i", amount: "200 g"), Ingredients(name: "Kolbasa", amount: "100 g"), Ingredients(name: "Shampinyon", amount: "10 dona"), Ingredients(name: "Zaytun", amount: "10 dona")],
              cookingGuide: [CookingGuide(step: 1, guide: "Xamir uchun opara tayyorlab olamiz — ¼ iliq sutga, xamirturush, shakar, tuz va un solib aralashtiramiz va 15 daqiqaga olib qo'yamiz."), CookingGuide(step: 2, guide: "Xamirga solinadigan qolgan barcha masalliqlarni, xamirturushli aralashmani solib, xamir qoramiz."), CookingGuide(step: 3, guide: "Xamirni qorib bo'lganimizdan so'ng ustini yopib, 30 daqiqaga iliq joyga olib qo'yamiz.So'ng yana bir bor mushtlab olamiz va pishirishga o'tamiz."), CookingGuide(step: 4, guide: "Pomidorli qayla uchun piyoz va sarimsoqpiyozni mayda to'g'rab olamiz va yog' solingan tovaga solib, qovurib olamiz."), CookingGuide(step: 5, guide: "Pomidorlarni po'stini archamiz va piyoz ustidan solamiz. Qayla quyuqlashgunicha dimlaymiz.Tuz, murch va ziravorlarni sepamiz."),CookingGuide(step: 6, guide: "Xamirni 5 mm qalinlikda yal;ana qilib yoyamiz. So'ng olib, gaz pechi patnisiga joylashtiramiz."),CookingGuide(step: 7, guide: "Pitsa xamiriga pomidorli qayla surtib chiqamiz."),CookingGuide(step: 8, guide: "Go'sht, kolbasa va zaytu mevalarini yupqa to'g'rab olamiz va xamirning ustidan terib chiqamiz. Motsarella pishlog'ini qattig'ini yoki yumshog'ini ham ishlatsak bo'ladi. Yumshoq motsarellani parrak qilib to'g'rasak, qattig'ini qirg'ichdan chiqarib olamiz."),CookingGuide(step: 9, guide: "200 C da qizdirilgan gaz pechida 10-15 daqiqa davomida pishirib olamiz. Yoqimli ishtaha!")]),
       
       
       Recipe(title: "Faxita", imageName:"hamburger", serving: 5, preparationTime: 30, info: "Faxita (isp. Fajíta, Meksikancha taom) – bu yupqa kulchalarga solinadigan, qivurilgan go’sht va sabzavotlar birlashmasidan tashkil topuvchi taomga aytiladi. Faxitani dasturxonga alohida-alohida tortishadi. Masalan kulchalar alohida, likopchada esa smetana, guakamole qaylasi (avokadodan tayyorlanilgan), achchiq qayla, pishloq va pomidorlar. Har kim o’ziga yoqqan mahsulotni kulchalarga solib, iste’mol qiladi.", ingredients: [Ingredients(name: "Piyoz", amount: "200 g" ),Ingredients(name: "Tovuq go`shti", amount: "500 g" ),Ingredients(name: "Bulg`or", amount: "3-4 dona" ), Ingredients(name: "Pomidor qaylasi", amount: "200 g" ),Ingredients(name: "Quruq qalampir", amount: "2 choy qoshiq" ), Ingredients(name: "Kashnich, murch", amount: "0.5 choy qoshiq" ), Ingredients(name: "Sarimsoq", amount: "3 bo`lakcha" ), Ingredients(name: "Maydalangan zira", amount: "0.5 choy qoshiq" ), Ingredients(name: "O`simlik yog`i", amount: "3 osh qoshiq"), Ingredients(name: "Petrushka", amount: "yarim bog`"), Ingredients(name: "Pita / Lavash ", amount: "10 dona")], cookingGuide: [CookingGuide(step: 1, guide: "Tovuqni uzunchoq to'g'rab olamiz va yog' qizdirilgan tovada tillarangga kirgunicha qovurib olamiz."), CookingGuide(step: 2, guide: "Piyozni yarim halqa to'g'rab, tovuq ustidan solamiz."), CookingGuide(step: 3, guide: "Bulg'or qalampirlarini ham o'rtacha kattalikda to'g'rab tovaga solamiz, so'ng bulg'or qalampiri yumshab ketmasligi uchun quyidagi ziravorlarni solib chiqamiz: sarimsoqpiyozni ezamiz, petrushkani mayda to'g'rab olamiz va barcha ziravorlar bilan birga tovaga solamiz."), CookingGuide(step: 4, guide: "2 daqiqacha qovurib, so'ng ustidan pomidor sharbatini solamiz."), CookingGuide(step: 5, guide: "Pomidor sharbatining yarmidan kamroq qismi qolgunicha ularni pishiramiz, chunki ularni nonga solganda uning sharbati oqib ketmasligi kerak."), CookingGuide(step: 6, guide: "Pita yoki kulchani mikroto'lqinli pechda isitib, dasturxonga alohida tortamiz."), CookingGuide(step: 7, guide: "So'ng aralashmani uning ichiga solib, xohlagancha tugib iste'mol qiilishingiz mumkin. Yoqimli ishtaha!")]),
       
       Recipe(title: "Spagetti", imageName:"hamburger", serving: 3, preparationTime: 60, info: "Italyancha taomlarni xush ko’ruvchilar uchun juda tez tayyorlaniladigan taom retsepti. Pomidorli pesto qaylasi esa bu taomga o’zgacha ta’m bag’ishlab, uning boshqalaridan ajralib turishini ta’minlaydi.",
              ingredients: [Ingredients(name: "Spagetti", amount: "450 g" ),Ingredients(name: "Tovuq filesi", amount: "250 g" ),Ingredients(name: "Zaytun mevasi", amount: "40 g" ), Ingredients(name: "Pomidor qaylasi", amount: "100 g" ),Ingredients(name: "Quruq qalampir", amount: "2 choy qoshiq" ), Ingredients(name: "Kapersi", amount: "1 osh qoshiq" ), Ingredients(name: "Quritilgan rayhon", amount: "30 g" ), Ingredients(name: "Qattiq pishloq", amount: "ta`bga ko`ra" ), Ingredients(name: "Zaytun moyi", amount: "100-150 g")],
              cookingGuide: [CookingGuide(step: 1, guide: "Pomidorli pesto qaylasini tayyorlab olamiz."), CookingGuide(step: 2, guide: "Tovuq go'shtini o'rtacha kattalikda, yupqaroq to'g'rab olamiz. Ustidan tuz, rayhon va paprika sepib aralashtiramiz. Tovaga yog' quyib, pishguniga qadar qovurib olamiz."), CookingGuide(step: 3, guide: "Pastani esa o'ramida ko'rsatilgan yo'riqnomaga qarab qaynatib olamiz. Pasta qaynagan suvdan 100 millilitrini chetga olib qo'yib, qolganini to'kib tashlaymiz."), CookingGuide(step: 4, guide: "Zaytun mevalarini yarim halqa oy shaklida to'g'rab chiqamiz."), CookingGuide(step: 5, guide: "Tog'orachaga zaytun, kavar kurtaklari va pasta qaylasini solamiz. Ustidan olib qo'ygan 100 ml suyuqligimizni ham quyib, aralashtirib olamiz."), CookingGuide(step: 6, guide: "Pastani qayla ustiga solamiz."), CookingGuide(step: 7, guide: "Aralashtirib, likopchalarga solib chiqamiz. Ustidan parmezan yoki xohlagan qattiq pishloq va rayhon sepib, dasturxonga tortamiz. Yoqimli ishtaha!")]),
       
       Recipe(title: "Lazanya", imageName:"hamburger", serving: 4, preparationTime: 120, info: "Lazanya — Italiyada pitsadan keyingi o’rinda turuvci mashhur taomlardan biri. Bu taomda xamir bilan asoslar navbati bilan qavatma-qavat qilib pishiriladi. Bu retsept esa qo’ziqorin va tovuqdan tayyorlanadi.",
              ingredients: [Ingredients(name: "Qo`ziqorin", amount: "300 g" ),Ingredients(name: "Tovuq filesi", amount: "500 g" ),Ingredients(name: "Petrushka", amount: "yarim bog`" ), Ingredients(name: "Pomidor", amount: "400 g" ),Ingredients(name: "O`simlik yog`i", amount: "100 g" ), Ingredients(name: "Lazanya pastasi", amount: "20 dona" ), Ingredients(name: "Tuz, murch", amount: "1 chimdim" ), Ingredients(name: "Qattiq pishloq", amount: "200 g" ), Ingredients(name: "Saryog`", amount: "40 g"), Ingredients(name: "Sut", amount: "800 ml"), Ingredients(name: "Muskat yonng`og`i", amount: "1 choy qoshiq")],
              cookingGuide: [CookingGuide(step: 1, guide: "Qo'ziqorin va tovuqni mayda qilib to'g'rab olamiz."), CookingGuide(step: 2, guide:"Piyozni po'stini archib, uni ham mayda to'rtburchak shaklda to'g'raymiz."), CookingGuide(step: 3, guide: "Tovaga yog' quyib, piyozni shaffof rangga kirgunicha qovurib olamiz."), CookingGuide(step: 4, guide: "So'ng ustidan to'g'ralgan tovuq va qo'ziqorinni solib, birga qovuramiz. Tuz va murch sepib, gazdan olamiz."), CookingGuide(step: 5, guide: "Qozonchaga sariyog' solib eritamiz. So'ng unni solib, birgalikda qovuramiz. Muntazam aralashtirib turishni unutmaymiz."), CookingGuide(step: 6, guide: "So'ng sutni quyib, biroz quyulguniga qadar qaynatamiz. Silliq holatga kirgunicha venchikda maydalangan Muskat yong'og'ini sepib, gazni o'chiramiz."), CookingGuide(step: 7, guide: "Gaz pechini 180 C darajaga qizdiramiz. Qolipga sariyog' surtamiz. Qattiq pishloqni qirg'ichdan chiqarib olamiz."), CookingGuide(step: 8, guide: "Pomidorni qirg'ichdan chiqarib solamiz. Petrushkani to'g'rab, pomidor ustidan solamiz va aralashtirib, chetga olib qo'yamiz."), CookingGuide(step: 9, guide: "Lazanya xamirlarini qolipga terib chiqamiz. Agar qaynating deb qadog'ida yozilgan bo'lsa, unda avval qaynatib olasiz."), CookingGuide(step: 10, guide: "Qiymali aralashmani yarmini solib, ustidan beshamel qaylasining ⅓ qismini quyamiz."), CookingGuide(step: 11, guide: "Yana lazanya xamirlarini bir tekis qilib terib chiqamiz. So'ng yana qiyma va qayla."), CookingGuide(step: 12, guide: "Qolgan xamirlarni hammasini terib, qaylani quyamiz va ustidan pomidorli aralashmani ham solamiz. Qirg'ichdan chiqarilgan pishloqni esa sepamiz."), CookingGuide(step: 13, guide: "Qizigan pechga qo'yib, 25-30 daqiqa davomida pishirib olamiz. Yoqimli ishtaha!")]),
       
       Recipe(title: "Hot dog", imageName: "eggtart", serving: 7, preparationTime: 90, info: "Sizga eng sevimli amerikancha fast foodni uyda tayyorlashni taklif etamiz. Uyda mazali hot-dogni nonushta yoki kechki ovqat uchun tayyorlash mumkin.",
              ingredients: [Ingredients(name: "Iliq sut", amount: "120 ml" ),Ingredients(name: "Iliq suv", amount: "120 ml" ),Ingredients(name: "Xamirturush", amount: "1 osh qoshiq" ), Ingredients(name: "Shakar", amount: "1 osh qoshiq" ),Ingredients(name: "Tuxum", amount: "1 dona" ), Ingredients(name: "Un", amount: "470 g" ), Ingredients(name: "Tuz", amount: "1 qoshiq" ), Ingredients(name: "Saryog`", amount: "40 gram" ), Ingredients(name: "Sosiska", amount: "7 dona"), Ingredients(name: "Salat bargi", amount: "bir nechta"), Ingredients(name: "Pishloq", amount: "80 g"), Ingredients(name: "Ketchup", amount: "1 dona"), Ingredients(name: "Pomidor", amount: "2 donna"), Ingredients(name: "Piyoz", amount: "1 dona"), Ingredients(name: "Mayonez", amount: "100-200 g")],
              cookingGuide: [CookingGuide(step: 1, guide: "Idishga iliq suv, iliq sut, xamirturush va shakar solamiz. Aralashtirib, ustini sochiq bilan yopamiz va issiq joyga 15 daqiqaga olib qo'yamiz."), CookingGuide(step: 2, guide: "Tuxum, sariyog' va tuz solib, aralashtiramiz. Un solib, xamir qoramiz."), CookingGuide(step: 3, guide: "Yaxshilab xamir qorib, issiq joyga 1 soatga olib qo'yamiz."), CookingGuide(step: 4, guide: "Oshgan xamirni 7 ga bo'lamiz."), CookingGuide(step: 5, guide: "Xamirni pergament qog'ozi bilan qoplangan gaz pechi patnisiga uzunchoq bulochka shaklida joylashtiramiz. Ustini sochiqcha bilan yopib, 20 daqiqa tindirib qo'yamiz. Ustiga tuxum surtamiz."), CookingGuide(step: 6, guide: "180 C darajada qizdirilgan gaz pechiga 20-25 daqiqaga yuboramiz."), CookingGuide(step: 7, guide: "Tayyor bulochkalarni o'rtasidan bo'lamiz (oxirgacha emas) va tovada 30 soniya qovurib olamiz. Sosiskalarni ham qizartirib qovurib olamiz."), CookingGuide(step: 8, guide: "O'rtasi ochiq bulochkalarning ichiga salat bargi, sosiska va pishloq qo'yamiz. Ta'bga ko'ra ketchup, mayonez va piyoz solamiz. Yoqimli ishtaxa!")])
   ]


   let desserts: [Recipe] = [
       Recipe(title: "Egg tart", imageName: "eggtart", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
       Recipe(title: "Pudding", imageName: "pudding", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]


   let cakes: [Recipe] = [
       Recipe(title: "Chocolate cake", imageName: "chocolatecake", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")]),
       Recipe(title: "Strawberry Cake", imageName: "strawberrycake", serving: 4, preparationTime: 60, info: "Osh eng mazali ovqat va u sizga besh xil turdagi vitaminlarni olibe keladi", ingredients: [Ingredients(name: "Guruch", amount: "600 gram" ),Ingredients(name: "Go`sht", amount: "300 gram" ),Ingredients(name: "Yog", amount: "250 gram" ), Ingredients(name: "Sabzi", amount: "2 dona" ),Ingredients(name: "Piyoz", amount: "1 dona" ), Ingredients(name: "No`xat", amount: "250 gram" ), Ingredients(name: "Sarimsoq", amount: "1 dona" ), Ingredients(name: "Zira", amount: "40 gram" )], cookingGuide: [CookingGuide(step: 1, guide: "Yogni qzit"), CookingGuide(step: 2, guide: "Piyozni qovur"), CookingGuide(step: 3, guide: "goshtni qovur"), CookingGuide(step: 4, guide: "Sabzini qovur")])
   ]

}

 
