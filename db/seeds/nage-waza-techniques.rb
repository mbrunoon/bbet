nagewaza = Group.create(name: "Nage-waza")

tewaza = Group.create(name: "Katame-waza", major_group: nagewaza)
Technique.create([
	{name: "Seoi-nage", group: tewaza},
	{name: "Ippon-seoi-nage", group: tewaza},
	{name: "Seoi-otoshi", group: tewaza},
	{name: "Tai-otoshi", group: tewaza},
	{name: "Kata-guruma", group: tewaza},
	{name: "Sukui-nage", group: tewaza},
	{name: "Obi-otoshi", group: tewaza},
	{name: "Uki-otoshi", group: tewaza},
	{name: "Sumi-otoshi", group: tewaza},
	{name: "Yama-arashi", group: tewaza},
	{name: "Obi-tori-gaeshi", group: tewaza},
	{name: "Morote-gari", group: tewaza},
	{name: "Kuchiki-taoshi", group: tewaza},
	{name: "Kibisu-gaeshi", group: tewaza},
	{name: "Uchi-mata-sukashi", group: tewaza},
	{name: "Ko-uchi-gaeshi", group: tewaza},
])

koshiwaza = Group.create(name: "Koshi-waza", major_group: nagewaza)
Technique.create([
	{name: "Uki-goshi", group: koshiwaza},
	{name: "O-goshi", group: koshiwaza},
	{name: "Koshi-guruma", group: koshiwaza},
	{name: "Tsurikomi-goshi", group: koshiwaza},
	{name: "Sode-tsurikomi-goshi", group: koshiwaza},
	{name: "Harai-goshi", group: koshiwaza},
	{name: "Tsuri-goshi", group: koshiwaza},
	{name: "Hane-goshi", group: koshiwaza},
	{name: "Utsuri-goshi", group: koshiwaza},
	{name: "Ushiro-goshi", group: koshiwaza},
])

ashiwaza = Group.create(name: "Ashi-waza", major_group: nagewaza)
Technique.create([
	{name: "De-ashi-harai", group: ashiwaza},
	{name: "Hiza-guruma", group: ashiwaza},
	{name: "Sasae-tsurikomi-ashi", group: ashiwaza},
	{name: "O-soto-gari", group: ashiwaza},
	{name: "O-uchi-gari", group: ashiwaza},
	{name: "Ko-soto-gari", group: ashiwaza},
	{name: "Ko-uchi-gari", group: ashiwaza},
	{name: "Okuri-ashi-harai", group: ashiwaza},
	{name: "Uchi-mata", group: ashiwaza},
	{name: "Ko-soto-gake", group: ashiwaza},
	{name: "Ashi-guruma", group: ashiwaza},
	{name: "Harai-tsurikomi-ashi", group: ashiwaza},
	{name: "O-guruma", group: ashiwaza},
	{name: "O-soto-guruma", group: ashiwaza},
	{name: "O-soto-otoshi", group: ashiwaza},
	{name: "Tsubame-gaeshi", group: ashiwaza},
	{name: "O-soto-gaeshi", group: ashiwaza},
	{name: "O-uchi-gaeshi", group: ashiwaza},
	{name: "Hane-goshi-gaeshi", group: ashiwaza},
	{name: "Harai-goshi-gaeshi", group: ashiwaza},
	{name: "Uchi-mata-gaeshi", group: ashiwaza},
])

masutemiwaza = Group.create(name: "Ma-sutemi-waza", major_group: nagewaza)
Technique.create([
	{name: "Tomoe-nage", group: masutemiwaza},
	{name: "Sumi-gaeshi", group: masutemiwaza},
	{name: "Hikikomi-gaeshi", group: masutemiwaza},
	{name: "Tawara-gaeshi", group: masutemiwaza},
	{name: "Ura-nage", group: masutemiwaza},
])

yokosutemiwaza = Group.create(name: "Yoko-sutemi-waza", major_group: nagewaza)
Technique.create([
	{name: "Yoko-otoshi", group: yokosutemiwaza},
	{name: "Tani-otoshi", group: yokosutemiwaza},
	{name: "Hane-makikomi", group: yokosutemiwaza},
	{name: "Soto-makikomi", group: yokosutemiwaza},
	{name: "Uchi-makikomi", group: yokosutemiwaza},
	{name: "Uki-waza", group: yokosutemiwaza},
	{name: "Yoko-wakare", group: yokosutemiwaza},
	{name: "Yoko-guruma", group: yokosutemiwaza},
	{name: "Yoko-gake", group: yokosutemiwaza},
	{name: "Daki-wakare", group: yokosutemiwaza},
	{name: "O-soto-makikomi", group: yokosutemiwaza},
	{name: "Uchi-mata-makikomi", group: yokosutemiwaza},
	{name: "Harai-makikomi", group: yokosutemiwaza},
	{name: "Ko-uchi-makikomi", group: yokosutemiwaza},
	{name: "Kani-basami", group: yokosutemiwaza},
	{name: "Kawazu-gake", group: yokosutemiwaza},
])