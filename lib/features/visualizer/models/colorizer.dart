import '../../../data/data_models/agent/agent.dart';
import '../../../data/data_models/nature/nature.dart';

abstract class Colorizer {
  int nature(Nature nature);
  int agent(Agent agent);
}
