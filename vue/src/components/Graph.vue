<template>
  <div>
    <Bar
      :chart-options="chartOptions"
      :chart-data="chartData"
      :chart-id="chartId"
      :dataset-id-key="datasetIdKey"
      :plugins="plugins"
      :css-classes="cssClasses"
      :styles="styles"
      :width="width"
      :height="height"
    />
  </div>
</template>

<script>
import PotholesService from "../services/PotholesService.js";
import { Bar } from "vue-chartjs/legacy";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

export default {


  created() {
    
    PotholesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
      let result = this.chartData.datasets[0];
      let result2 = result.data;
      result2.push(this.filterByStatusPending);
      result2.push(this.filterByStatusRepair);
      result2.push(this.filterByStatusFixed);
      result2.push(this.filterByStatusReject);
      
    });
    
  },
  name: "BarChart",
  components: { Bar },
  props: {
   
    chartId: {
      type: String,
      default: "bar-chart",
    },
    datasetIdKey: {
      type: String,
      default: "label",
    },
    width: {
      type: Number,
      default: 400,
    },
    height: {
      type: Number,
      default: 400,
    },
    cssClasses: {
      default: "",
      type: String,
    },
    styles: {
      type: Object,
      default: () => {},
    },
    plugins: {
      type: Object,
      default: () => {},
    },
   
  },
  computed: {
    filterByStatusPending() {
      let filteredPotholes = this.potholes;
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Pending";
      });
      return results.length;
    },
    filterByStatusRepair() {
      let filteredPotholes = this.potholes;
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Repair Scheduled";
      });
      return results.length;
    },
    filterByStatusFixed() {
      let filteredPotholes = this.potholes;
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Fixed";
      });
      return results.length;
    },
    filterByStatusReject() {
      let filteredPotholes = this.potholes;
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Reject";
      });
      return results.length;
    },
  },
  data() {
    return {
      potholes: [],
      chartData: {
        labels: ["Pending", "Repair Scheduled", "Fixed", "Rejected"],
        datasets: [{ data: [] }],
      },
      chartOptions: {
        responsive: true,
      },
    };
  },
};
</script>

<style scoped>
div {
  display: flex;
  justify-content: center;
  align-items: center;
}

</style>