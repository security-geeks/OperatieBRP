/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.bevraging.domein;

/**
 * De reden voor de eventuele opschorting van de bijhouding van de persoonsgegevens.
 *
 * Er kan een reden zijn om de bijhouding van de meeste gegevens van een persoon te staken, en alleen zeer summier nog
 * gegevens bij te houden (te denken valt aan alleen doorvoeren van historische wijzigingen). Men spreekt dan wel van
 * een opschorting van de bijhouding. Indien er geen reden opschorting is, dan is er ook geen sprake van opschorting. In
 * geval van opschorting wegens 'Fout' worden in principe zelfs geen historische wijzigingen doorgevoerd.
 */
public enum RedenOpschorting {

    /**
     * Deze enumeratie correspondeert met een statische tabel waarvan de id's bij 1 beginnen te tellen. De ordinal van
     * een enum begint echter bij 0.
     */
    DUMMY(null, null),
    /**
     * De persoon is overleden.
     */
    OVERLEDEN("O", "Overleden"),
    /**
     * Bijhouding opgeschort bij ministerieel besluit.
     */
    MINISTERIEEL_BESLUIT("M", "Ministerieel besluit"),
    /**
     * Bijhouding opgeschort als gevolg van een fout.
     */
    FOUT("F", "Fout"),
    /**
     * Bijhouding opgeschort vanwege een onbekende reden.
     */
    ONBEKEND("?", "Onbekend");

    private String code;
    private String naam;

    /**
     * Constructor voor de initialisatie van de enumeratie.
     *
     * @param code code.
     * @param naam naam.
     */
    private RedenOpschorting(final String code, final String naam) {
        this.code = code;
        this.naam = naam;
    }

    public String getCode() {
        return code;
    }

    public String getNaam() {
        return naam;
    }
}
