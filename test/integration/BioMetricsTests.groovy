class BioMetricsTests extends GroovyTestCase {

    void testToHTML() {
          def bio = new BioMetrics(
             height:66,
             weight:190,
             waist:38,
             chest: 54,
             bicep:20,
             thigh:30
         )
         println("bioMetrics str : " + bio)
         println("bioMetrics html: " + bio.toHTML())
    }


}
