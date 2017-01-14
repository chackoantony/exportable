module Helper
	module XlsHelper
		DATA_DIR = 'spec/data'

		def write_xls( options = {} )
			File.open("#{DATA_DIR}/test.xls", 'wb') {|f| f.write ExportableModel.export_xls options}
      book = Spreadsheet.open("#{DATA_DIR}/test.xls")
      File.delete("#{DATA_DIR}/test.xls") 
      book.worksheet 0
		end
	end
end