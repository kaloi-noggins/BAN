/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author rebeca
 */
public class AmbulatoriosBean {
   private int nroa;
   private int capacidade;
   private int andar;
   
   public AmbulatoriosBean(int nroa, int capacidade, int andar) {
       this.nroa= nroa;
       this.capacidade = capacidade;
       this.andar = andar;
   }

    /**
     * @return the nroa
     */
    public int getNroa() {
        return nroa;
    }

    /**
     * @param nroa the nroa to set
     */
    public void setNroa(int nroa) {
        this.nroa = nroa;
    }

    /**
     * @return the capacidade
     */
    public int getCapacidade() {
        return capacidade;
    }

    /**
     * @param capacidade the capacidade to set
     */
    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    /**
     * @return the andar
     */
    public int getAndar() {
        return andar;
    }

    /**
     * @param andar the andar to set
     */
    public void setAndar(int andar) {
        this.andar = andar;
    }
   
    public String toString(){
        return "Nroa: "+nroa+" capacidade: "+capacidade+" andar: "+andar;
    }
}