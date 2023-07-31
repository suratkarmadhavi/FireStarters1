<script>
import { PatientCard } from "fire-starters";

import PatientFHIRJson from "../json/patient/patient_1.json";

export default {
  components: {
    PatientCard,
  },
  data() {
    return {
      fhirJson: PatientFHIRJson,
    };
  },
};
</script>

<template>
  <patient-card :data="fhirJson"></patient-card>
</template>

<style scoped></style>
