public class conmethod {

list<lead> ld;
    public PageReference dosearch() {
    
     ld=(list<lead>)[FIND :searchText RETURNING Lead(Name, Email, Phone)][0];
        return null;
    }

   public List<Lead> getResults() {

        return ld;
    }


public string searchtext{set;get;}

}