package env;

import jason.asSyntax.Literal;
import jason.asSyntax.Structure;
import jason.environment.Environment;

import java.util.Collection;
import java.util.Collections;
import java.util.Random;
import java.util.logging.Logger;

public class TemperatureEnvironment extends Environment {

    private static final Random RAND = new Random();

    // action literals
    public static final Literal hotAir = Literal.parseLiteral("spray_air(hot)");
    public static final Literal coldAir = Literal.parseLiteral("spray_air(cold)");

    static Logger logger = Logger.getLogger(TemperatureEnvironment.class.getName());

    private double temperature;

    @Override
    public void init(final String[] args) {
        if (args.length >= 1) {
            temperature = Double.parseDouble(args[0]);
        } else {
            temperature = RAND.nextDouble() * 20 + 10;
        }
    }

    @Override
    public Collection<Literal> getPercepts(String agName) {
        return Collections.singletonList(
                Literal.parseLiteral(String.format("temperature(%s)", temperature))
        );
    }

    private static final double FAILURE_PROBABILITY = 0.2;

    @Override
    public boolean executeAction(final String ag, final Structure action) {
        boolean result = true;
        if (RAND.nextDouble() < FAILURE_PROBABILITY) {
            result = false;
        } else if (action.equals(hotAir)) {
            temperature += 0.1;
        } else if (action.equals(coldAir)) {
            temperature -= 0.1;
        } else {
            RuntimeException e = new IllegalArgumentException("Cannot handle action: " + action);
            logger.warning(e.getMessage());
            throw e;
        }
        try {
            Thread.sleep(500L); // Slowdown the system
        } catch (InterruptedException ignored) {
        }
        return result;
    }
}
