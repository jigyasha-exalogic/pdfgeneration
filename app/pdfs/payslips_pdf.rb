class PayslipsPdf < Prawn::Document
  def initialize(payslip,month)
    super(top_margin: 50)
    @payslip = payslip
    @user = User.find(@payslip.userid)
    @acc = Account.find(@payslip.userid)
    @month = month
    line_items_1
    line_items
    line_items_2
    line_items_3
  end

  def payslip_number
    text "Payslip \##{@payslip.pay_id}", size: 30, style: :bold
  end

  def line_items_1
    image "#{Rails.root}/app/assets/images/exalogic.png", :width => 120
    move_down 10
    table_data = [[{ content: "Exalogic Solutions", colspan: 4, align: :center, :font_style => :bold} ],
          [{ content: "22, Ganganagar, 1st Main Road, Bangalore - 560032, India", colspan: 4, align: :center }],
          [{ content: @month<<"  "<<@payslip.year.to_i.to_s<<"  Payslip", colspan: 4, align: :center, :font_style => :bold  }],]
     table(table_data, :width=>540, :cell_style => {:border_width => 0})
     move_down 10   
      stroke_horizontal_rule
  end

  def line_items_2
    move_down 30
    text "Details", align: :center, :font_style => :bold
    table_data = [[{content: "Earnings", align: :center, :font_style => :bold},{content: "Amount", align: :center, :font_style => :bold},{content: "Deductions", align: :center, :font_style => :bold},{content: "Amount", align: :center, :font_style => :bold}],
                  ["Basic Pay",@payslip.basic.to_i,"Professional Tax",@payslip.pt.to_i],
                  ["HRA",@payslip.hra.to_i,"Loss of Pay",@payslip.lop.to_i],
                  ["CCA",@payslip.cca.to_i,"Deductions",@payslip.od.to_i],
                  ["Special Allowance",@payslip.sa.to_i,nil,nil],
                  ["Transport Allowance",@payslip.ta.to_i,nil,nil],
                  [{content: "Gross Salary",:font_style => :bold},(@payslip.basic + @payslip.hra + @payslip.cca + @payslip.sa+ @payslip.ta).to_i,{content: "Total Deductions",:font_style => :bold},(@payslip.od+@payslip.lop+@payslip.pt).to_i],
                  [nil,nil,{content: "Net Pay",:font_style => :bold},(@payslip.basic + @payslip.hra + @payslip.cca + @payslip.sa+ @payslip.ta-(@payslip.od+@payslip.lop+@payslip.pt)).to_i]]
    table(table_data, :width=>540)
  end

  def line_items_3
    move_down 30
    text "Net Pay (in words) : Rs. " << (@payslip.basic + @payslip.hra + @payslip.cca + @payslip.sa+ @payslip.ta-(@payslip.od+@payslip.lop+@payslip.pt)).humanize.capitalize << " only."
    move_down 30    
    stroke_horizontal_rule
    move_down 30 
    text "***This is a system generated payslip and does not require signature.", align: :center
  end

  def line_items
    move_down 20
    table_data = [[{content: "Employee ID",:font_style => :bold},@user.empid,{content:"Employee Name",:font_style => :bold},@acc.acname],
                  ["Department",@user.department,"Designation",@user.designation],
                  ["Date of Joining",@user.date_of_joining,"Account Number",@acc.acno],
                  ["Bank",@acc.bankname<<", "<<@acc.branch,"IFSC Code",@acc.ifsc]]
    table(table_data, :width=>540, :cell_style => {:border_width => 0})
  end

end

