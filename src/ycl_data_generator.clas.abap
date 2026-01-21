CLASS ycl_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

        INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_data_generator IMPLEMENTATION.

                METHOD if_oo_adt_classrun~main.
                    " Delete existing entries in custom database tables.

                   DELETE FROM ytravel_tech_m.
                   DELETE FROM ybooking_tech_m.
                   DELETE FROM ybooksupp_tech_m.
                   COMMIT WORK.
                    " insert travel demo data.

                   INSERT ytravel_tech_m FROM ( SELECT * FROM /DMO/TRAVEL_M ).

                   COMMIT WORK.

                    " insert booking demo data.

                   INSERT ybooking_tech_m FROM ( SELECT * FROM /DMO/BOOKING_M
*                                                          JOIN ytravel_tech_m AS Y
*                                                            ON /DMO/BOOKING_m~travel_id = Y~travel_id
                                               ).
                   COMMIT WORK.

                   INSERT ybooksupp_tech_m FROM ( SELECT * FROM /DMO/BOOKSUPPL_M

                                                ).

                   COMMIT WORK.

                   OUT->write(
                     EXPORTING
                       data   = 'Travel and Booking demo data inserted.'
*                       name   =
*                     RECEIVING
*                       output =
                   ).


                ENDMETHOD.
ENDCLASS.
