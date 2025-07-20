package stock.backing;

import javax.faces.component.UISelectItems;

import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.BindingContext;
import oracle.adf.model.binding.DCBindingContainer;
import oracle.adf.view.rich.component.rich.RichDocument;
import oracle.adf.view.rich.component.rich.RichForm;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.fragment.RichPageTemplate;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichSelectBooleanCheckbox;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.component.rich.layout.RichPanelBox;
import oracle.adf.view.rich.component.rich.layout.RichPanelFormLayout;
import oracle.adf.view.rich.component.rich.layout.RichPanelGroupLayout;
import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.component.rich.output.RichMessages;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.jbo.Row;
import oracle.jbo.ViewObject;
import oracle.jbo.domain.Date;

import org.apache.myfaces.trinidad.event.AttributeChangeEvent;

public class VItemTran {
    private RichPageTemplate pt1;
    private RichForm f1;
    private RichDocument d1;
    private RichPanelGroupLayout pgl1;
    private RichPanelBox pb1;
    private RichPanelBox pb2;
    private RichMessages m1;
    private RichTable t1;
    private RichPanelFormLayout pfl1;
    private RichSelectOneChoice soc1;
    private UISelectItems si1;
    private RichSelectOneChoice soc2;
    private UISelectItems si2;
    private RichInputDate id2;
    private RichInputDate id3;
    private RichSelectOneChoice soc3;
    private UISelectItems si3;
    private RichButton b1;
    private RichButton b2;
    private RichSelectBooleanCheckbox sbc1;
    private RichSelectBooleanCheckbox sbc2;
    //  private RichButton b2;

    public VItemTran(){
            if (! AdfFacesContext.getCurrentInstance().isPostback())
            {
                DCBindingContainer DCBC = (DCBindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();
                DCBC.findIteratorBinding("VItemTranRO1Iterator").getViewObject().executeEmptyRowSet();
                
                }
        
        } 
    public void setPt1(RichPageTemplate pt1) {
        this.pt1 = pt1;
    }

    public RichPageTemplate getPt1() {
        return pt1;
    }

    public void setF1(RichForm f1) {
        this.f1 = f1;
    }

    public RichForm getF1() {
        return f1;
    }

    public void setD1(RichDocument d1) {
        this.d1 = d1;
    }

    public RichDocument getD1() {
        return d1;
    }


    public void setPgl1(RichPanelGroupLayout pgl1) {
        this.pgl1 = pgl1;
    }

    public RichPanelGroupLayout getPgl1() {
        return pgl1;
    }

    public void setPb1(RichPanelBox pb1) {
        this.pb1 = pb1;
    }

    public RichPanelBox getPb1() {
        return pb1;
    }

    public void setPb2(RichPanelBox pb2) {
        this.pb2 = pb2;
    }

    public RichPanelBox getPb2() {
        return pb2;
    }

    public void setM1(RichMessages m1) {
        this.m1 = m1;
    }

    public RichMessages getM1() {
        return m1;
    }

    public void setT1(RichTable t1) {
        this.t1 = t1;
    }

    public RichTable getT1() {
        return t1;
    }

    public void setPfl1(RichPanelFormLayout pfl1) {
        this.pfl1 = pfl1;
    }

    public RichPanelFormLayout getPfl1() {
        return pfl1;
    }

    public void setSoc1(RichSelectOneChoice soc1) {
        this.soc1 = soc1;
    }

    public RichSelectOneChoice getSoc1() {
        return soc1;
    }

    public void setSi1(UISelectItems si1) {
        this.si1 = si1;
    }

    public UISelectItems getSi1() {
        return si1;
    }

    public void setSoc2(RichSelectOneChoice soc2) {
        this.soc2 = soc2;
    }

    public RichSelectOneChoice getSoc2() {
        return soc2;
    }

    public void setSi2(UISelectItems si2) {
        this.si2 = si2;
    }

    public UISelectItems getSi2() {
        return si2;
    }

    public void setId2(RichInputDate id2) {
        this.id2 = id2;
    }

    public RichInputDate getId2() {
        return id2;
    }

    public void setId3(RichInputDate id3) {
        this.id3 = id3;
    }

    public RichInputDate getId3() {
        return id3;
    }

    public void setSoc3(RichSelectOneChoice soc3) {
        this.soc3 = soc3;
    }

    public RichSelectOneChoice getSoc3() {
        return soc3;
    }

    public void setSi3(UISelectItems si3) {
        this.si3 = si3;
    }

    public UISelectItems getSi3() {
        return si3;
    }


    public void setB1(RichButton b1) {
        this.b1 = b1;
    }

    public RichButton getB1() {
        return b1;
    }

    public void setB2(RichButton b2) {
        this.b2 = b2;
    }

    public RichButton getB2() {
        return b2;
    }


    public String search_action() {
        // Add event code here...
 
        return null;
    }



    public String Search_action() {
        // Add event code here...
        
        DCBindingContainer dcbc = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        ViewObject vo = dcbc.findIteratorBinding("VItemTranRO1Iterator").getViewObject();
        String wherecon =null;
        
        Row row = dcbc.findIteratorBinding("BlockSearchVItemTran1Iterator").getCurrentRow();
        if (row != null)
        {
           String itemTypes = (String )row.getAttribute("ItemType") ;
           oracle.jbo.domain.Number itemCode  = (oracle.jbo.domain.Number) row.getAttribute("ItemCode");
           oracle.jbo.domain.Date FromDate  = (oracle.jbo.domain.Date) row.getAttribute("FromDate");
            oracle.jbo.domain.Number branchCode = (oracle.jbo.domain.Number)row.getAttribute("BranchCode");
           Date  ToDate = (Date) row.getAttribute("ToDate");
            
           
            
          wherecon = "Item_code = " +itemCode; 
             if(FromDate != null && ToDate != null){
              wherecon +=  " AND (BILL_DATE >=TO_DATE(NVL('"+ FromDate +"','1/1/1900'),'YYYY-MM-DD')  AND BILL_DATE <=TO_DATE(NVL('"+ ToDate +"','1/1/2900'),'YYYY-MM-DD'))";
             }
             if (branchCode != null )
             {
           wherecon+= "AND branch_code = " + branchCode ; 
                 }
         }
        
        
        vo.setWhereClause(wherecon);
        vo.executeQuery();
        return null;
    }

    public void setSbc1(RichSelectBooleanCheckbox sbc1) {
        this.sbc1 = sbc1;
    }

    public RichSelectBooleanCheckbox getSbc1() {
        return sbc1;
    }


    public void setSbc2(RichSelectBooleanCheckbox sbc2) {
        this.sbc2 = sbc2;
    }

    public RichSelectBooleanCheckbox getSbc2() {
        return sbc2;
    }

    public void sbc2_valueChangeListener(ValueChangeEvent valueChangeEvent) {
        boolean newValue = (Boolean) valueChangeEvent.getNewValue();
        System.out.println("newValue : " + newValue);
        DCBindingContainer dcbc = (DCBindingContainer) BindingContext.getCurrent().getCurrentBindingsEntry();
        Row row = dcbc.findIteratorBinding("BlockSearchVItemTran1Iterator").getCurrentRow();
        if (row != null) {
            if(newValue == true){
                row.setAttribute("BranchCode", null);
            }   
        }
    }
}
