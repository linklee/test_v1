module AnswersHelper
	def self.getDiff (text1, text2)
		#if text2 = nill just return text1
		return text1 if !text2 or !text1
		#output in html format
		Differ.format = :html
		diff = Differ.diff_by_word(text1,text2)
	end
end
