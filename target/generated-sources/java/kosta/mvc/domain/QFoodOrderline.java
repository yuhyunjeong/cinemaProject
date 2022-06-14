package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QFoodOrderline is a Querydsl query type for FoodOrderline
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QFoodOrderline extends EntityPathBase<FoodOrderline> {

    private static final long serialVersionUID = 546595520L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QFoodOrderline foodOrderline = new QFoodOrderline("foodOrderline");

    public final QFood food;

    public final NumberPath<Long> foodOrderlineCode = createNumber("foodOrderlineCode", Long.class);

    public final QOrders order;

    public final NumberPath<Integer> qty = createNumber("qty", Integer.class);

    public final NumberPath<Integer> sumPrice = createNumber("sumPrice", Integer.class);

    public QFoodOrderline(String variable) {
        this(FoodOrderline.class, forVariable(variable), INITS);
    }

    public QFoodOrderline(Path<? extends FoodOrderline> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QFoodOrderline(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QFoodOrderline(PathMetadata metadata, PathInits inits) {
        this(FoodOrderline.class, metadata, inits);
    }

    public QFoodOrderline(Class<? extends FoodOrderline> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.food = inits.isInitialized("food") ? new QFood(forProperty("food")) : null;
        this.order = inits.isInitialized("order") ? new QOrders(forProperty("order"), inits.get("order")) : null;
    }

}

