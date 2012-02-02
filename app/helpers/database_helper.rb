module DatabaseHelper
  def row_name row
    model = row.class
    name_col = column_used_for_name(model)
    return row["name"] if name_col == "name"
    return "#{model.name}##{row["id"]}" if name_col == "id"
    nil
  end
  
  def show_name_column? model
    column_used_for_name(model) != nil
  end

  def name_column_header model
    name_col = column_used_for_name model
    return "name" if  name_col == "name"
    return "" if name_col == "id"
    nil
  end

  def column_used_for_name model
    cols = model.columns.collect(&:name)
    return "name" if cols.include? "name"
    return "id" if cols.include? "id"
    nil
  end

  def data_columns model
    cols = model.columns.collect(&:name)
    cols -= [column_used_for_name(model)] 
    cols - ["created_at", "updated_at"]
  end 
end
