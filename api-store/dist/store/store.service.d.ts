import { Model } from 'mongoose';
import { Store } from './interface/store.interface';
import { CreateStoreDto } from './dto/create-store.dto';
import { Product } from './schema/store.schema';
export declare class StoreService {
    private readonly storeModel;
    constructor(storeModel: Model<Store>);
    create(createStoreDto: CreateStoreDto): Promise<Store>;
    findByName(name: string): Promise<Store>;
    getId(name: string): Promise<string | null>;
    deleteStoreById(storeId: string): Promise<void>;
    getProducts(storeId: string): Promise<Product[]>;
    findAll(): Promise<Store[]>;
}
