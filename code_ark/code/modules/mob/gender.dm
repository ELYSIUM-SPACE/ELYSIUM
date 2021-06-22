// Попытка в перевод эмоутов. Здесь есть русские аналоги
// переменных, которые используются в английском,
// например их his это наш his_ru. Замечу,
// что мы не переписываем, а добавляем - Теч
/datum/gender
	var/He_ru   = "Они"
	var/he_ru   = "они"
	var/His_ru  = "Их"
	var/his_ru  = "их"
	var/him_ru  = "them"
	var/has_ru  = "have"
//	var/is_ru   = "are" // Мы не используем вспомогательные глаголы в русском
//	var/does_ru = "do" // Мы не используем вспомогательные глаголы в русском
//	var/self_ru = "themselves" // В русском языке используются возвратные глаголы, а не земсэлфы.

/datum/gender/plural
	formal_term = "other"

/datum/gender/male
	He_ru   = "He"
	he_ru   = "he"
	His_ru  = "His"
	his_ru  = "his"
	him_ru  = "him"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "himself"

/datum/gender/female
	He_ru   = "She"
	he_ru   = "she"
	His_ru  = "Her"
	his_ru  = "her"
	him_ru  = "her"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "herself"

/datum/gender/neuter
	formal_term = "other"

	He_ru   = "It"
	he_ru   = "it"
	His_ru  = "Its"
	his_ru  = "its"
	him_ru  = "it"
	has_ru  = "has"
	is_ru   = "is"
	does_ru = "does"
	self_ru = "itself"
