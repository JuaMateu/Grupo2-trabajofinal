import { StoreService } from './store.service';
import { CreateStoreDto } from './dto/create-store.dto';
import { Store } from './interface/store.interface';
import { Product } from './schema/store.schema';
export declare class StoreController {
    private readonly storeService;
    constructor(storeService: StoreService);
    create(createStoreDto: CreateStoreDto): Promise<Store>;
    findAll(): Promise<Store[]>;
    getStoreId(storeName: string): Promise<string | null>;
    deleteStoreById(id: string): Promise<void>;
    getProducts(id: string): Promise<Product[]>;
}
