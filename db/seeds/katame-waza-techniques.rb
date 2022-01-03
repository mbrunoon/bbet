katamewaza = Group.create(name: "Katame-waza")

osaekomiwaza = Group.create(name: "Osaekomi-waza", major_group: katamewaza)
Technique.create([
	{name: "Kesa-gatame", group: osaekomiwaza},
	{name: "Kuzure-kesa-gatame", group: osaekomiwaza},
	{name: "Ushiro-kesa-gatame", group: osaekomiwaza},
	{name: "Kata-gatame", group: osaekomiwaza},
	{name: "Kami-shiho-gatame", group: osaekomiwaza},
	{name: "Kuzure-kami-shiho-gatame", group: osaekomiwaza},
	{name: "Yoko-shiho-gatame", group: osaekomiwaza},
	{name: "Tate-shiho-gatame", group: osaekomiwaza},
	{name: "Uki-gatame", group: osaekomiwaza},
	{name: "Ura-gatame", group: osaekomiwaza},
])

kansetsuwaza = Group.create(name: "Kansetsu-waza", major_group: katamewaza)
Technique.create([
	{name: "Ude-garami", group: kansetsuwaza},
	{name: "Ude-hishigi-juji-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-ude-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-hiza-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-waki-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-hara-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-ashi-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-te-gatame", group: kansetsuwaza},
	{name: "Ude-hishigi-sankaku-gatame", group: kansetsuwaza},
	{name: "Ashi-garami", group: kansetsuwaza},
])

shimewaza = Group.create(name: "Shime-waza", major_group: katamewaza)
Technique.create([
	{name: "Nami-juji-jime", group: shimewaza},
	{name: "Gyaku-juji-jime", group: shimewaza},
	{name: "Kata-juji-jime", group: shimewaza},
	{name: "Hadaka-jime", group: shimewaza},
	{name: "Okuri-eri-jime", group: shimewaza},
	{name: "Kataha-jime", group: shimewaza},
	{name: "Katate-jime", group: shimewaza},
	{name: "Ryote-jime", group: shimewaza},
	{name: "Sode-guruma-jime", group: shimewaza},
	{name: "Tsukkomi-jime", group: shimewaza},
	{name: "Sankaku-jime", group: shimewaza},
	{name: "Do-jime", group: shimewaza},
])